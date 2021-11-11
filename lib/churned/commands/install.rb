# frozen_string_literal: true

require_relative '../command'

module Churned
  module Commands
    class Install < Churned::Command
      def initialize(options)
        @options = options
      end

      def execute(filename = ".churned/hashes.txt", input: $stdin, output: $stdout)
        db.create
        command.run("git log --no-merges --pretty=format:'%H%n%ad%n%ae' --numstat --since=1.years > #{filename}")
        db.load(filename)
      end
    end
  end
end
