# frozen_string_literal: true

require_relative '../command'

module Churned
  module Commands
    class Install < Churned::Command
      def initialize(options)
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        generator.create_dir(".churned")
        generator.remove_file ".churned/database"

        ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ".churned/database")

        ActiveRecord::Schema.define do
          create_table :commits, id: :integer, force: :cascade do |t|
            t.string :sha
          end
        end

        command.run("git log --no-merges --pretty=format:'%H' --since=1.years > .churned/hashes.txt")
        IO.readlines('.churned/hashes.txt', chomp: true).each { |line| Commit.create(sha: line)}
      end
    end
  end
end
