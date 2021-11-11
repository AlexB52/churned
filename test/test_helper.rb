ENV["TTY_ENV"] = "test"

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "churned"

require "minitest/autorun"
