require "active_record"
require "sqlite3"
require "churned/version"
require "churned/cli"

# ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ".churned/database")

class Commit < ActiveRecord::Base
end

module Churned
  class Error < StandardError; end
  # Your code goes here...
end
