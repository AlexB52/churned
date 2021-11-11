require "active_record"
require "sqlite3"

module Churned
  def db_config
    {
      "production"  => { "database_name" => ".churned/db.sqlite" },
      "test"        => { "database_name" => ".churned/db_test.sqlite" },
      "development" => { "database_name" => ".churned/db_development.sqlite" },
    }
  end

  def database
    db_config[ENV["TTY_ENV"]]["database_name"]
  end
  module_function :db_config, :database
end

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: Churned.database)