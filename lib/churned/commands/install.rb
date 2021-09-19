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
          create_table :commits, force: true do |t|
            t.string :sha
            t.string :author
            t.date :author_date
          end

          create_table :file_changes, force: true do |t|
            t.references :commit
            t.string :pathname
            t.integer :additions
            t.integer :deletions
          end
        end

        command.run("git log --no-merges --pretty=format:'%H%n%ad%n%ae' --numstat --since=1.years > .churned/hashes.txt")

        IO.read('.churned/hashes.txt').split("\n\n") do |description|
          lines = description.split("\n")

          sha    = lines.shift
          date   = lines.shift
          author = lines.shift
          commit = Commit.new(sha: sha, author_date: date, author: author)

          lines.each do |numstat|
            additions, deletions, pathname = numstat.split("\t")
            commit.file_changes.build(additions: additions, deletions: deletions, pathname: pathname)
          end

          commit.save
        end
      end
    end
  end
end
