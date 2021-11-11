# frozen_string_literal: true

require_relative '../../command'

module Churned
  module Commands
    module DB
      class Load < Churned::Command
        def initialize(options)
          @options = options
        end

        def self.execute(filename)
          new({}).execute(filename, input: $stdin, output: $stdout)
        end

        def execute(filename, input: $stdin, output: $stdout)
          IO.read(filename).split("\n\n").each do |description|
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
