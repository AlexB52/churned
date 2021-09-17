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

        ActiveRecord::Schema.define do
          create_table :posts, force: true do |t|
          end

          create_table :comments, force: true do |t|
            t.integer :post_id
          end
        end
      end
    end
  end
end
