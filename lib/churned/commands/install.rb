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
            t.string :hash
          end
        end
      end
    end
  end
end
