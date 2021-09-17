require "active_record"
require "sqlite3"
require "churned/version"
require "churned/cli"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ".churned/database")

module Churned
  class Commit < ActiveRecord::Base
  end

  class Error < StandardError; end
  # Your code goes here...
end
