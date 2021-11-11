# frozen_string_literal: true

require 'thor'
require_relative 'db/load'
require_relative 'db/create'

module Churned
  module Commands
    module DB
      module_function

      def create
        Create.execute
      end

      def load(filename)
        Load.execute(filename)
      end
    end
  end
end
