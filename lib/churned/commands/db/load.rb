# frozen_string_literal: true

require_relative '../../command'

module Churned
  module Commands
    module DB
      class Load < Churned::Command
        def initialize(options)
          @options = options
        end

        def self.execute
          new({}).execute(input: $stdin, output: $stdout)
        end

        def execute(input: $stdin, output: $stdout)
          command.run("git log --no-merges --pretty=format:'%H%n%ad%n%ae' --numstat --since=1.years > .churned/hashes.txt")

          IO.read('.churned/hashes.txt').split("\n\n").each do |description|
            sha, date, author, *numstats = description.split("\n")

            commit = Commit.new(sha: sha, author_date: date, author: author)

            numstats.each do |numstat|
              additions, deletions, pathname = numstat.split("\t")
              commit.file_changes.build(additions: additions, deletions: deletions, pathname: pathname)
            end

            commit.save
          end
        end
      end
    end
  end
end
