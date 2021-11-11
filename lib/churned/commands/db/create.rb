# frozen_string_literal: true

require_relative '../../command'

module Churned
  module Commands
    module DB
      class Create < Churned::Command
        def initialize(options)
          @options = options
        end

        def self.execute
          new({}).execute(input: $stdin, output: $stdout)
        end

        def execute(input: $stdin, output: $stdout)
          generator.create_dir(".churned")

          ActiveRecord::Schema.define do
            create_table :commits, force: true do |t|
              t.string :sha
              t.string :author
              t.date :author_date
            end

            create_table :file_changes, force: true do |t|
              t.references :commit
              t.string :pathname
              t.integer :additions, default: 0
              t.integer :deletions, default: 0
            end
          end

        end
      end
    end
  end
end
