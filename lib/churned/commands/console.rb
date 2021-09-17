# frozen_string_literal: true

require_relative '../command'
require "byebug"
module Churned
  module Commands
    class Console < Churned::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        Pry.start
      end
    end
  end
end
