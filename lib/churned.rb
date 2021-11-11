require_relative "../config/database"
require "churned/version"
require "churned/cli"

module Churned
  class Commit < ActiveRecord::Base
    has_many :file_changes
  end

  class FileChange < ActiveRecord::Base
    belongs_to :commit
  end

  class Error < StandardError; end
  # Your code goes here...
end
