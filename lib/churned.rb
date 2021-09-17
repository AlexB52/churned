require "active_record"
require "sqlite3"
# require "logger"
require "churned/version"
require "churned/cli"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ".churned/database")
# ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

module Churned
  class Error < StandardError; end
  # Your code goes here...
end
