GEM_ROOT = File.expand_path('../../', __FILE__)
$LOAD_PATH.unshift File.join(GEM_ROOT, 'lib')

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
else
# require 'simplecov'
# SimpleCov.start
end

require 'naught'
Dir[File.join(GEM_ROOT, 'spec', 'support', '**/*.rb')].each { |f| require f }

require 'mutant'
require 'mutant-rspec'

# Monkeypatch to mutant all specs per mutation.
#
# TODO: Use master once it supports configurable implicit coverage.
#
# Morpher predicates are needed to finally make this configurable in mutant.
#
module Mutant

  module Rspec
    class Killer

      # Return all example groups
      #
      # @return [Enumerable<RSpec::Example>]
      #
      # @api private
      #
      def example_groups
        strategy.example_groups
      end

    end # Rspec
  end # Killer
end # Mutant
