ENV["TTY_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "churned"
require "churned/commands/db"
require "byebug"
require "minitest/autorun"

Churned::Commands::DB.create
Churned::Commands::DB.load('./test/support/fixtures/hashes.txt')
