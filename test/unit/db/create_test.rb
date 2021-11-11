require 'test_helper'
require 'churned/commands/db/create'

class Churned::Commands::Db::CreateTest < Minitest::Test
  def test_executes_db_create_command_successfully
    output = StringIO.new
    options = {}
    command = Churned::Commands::Db::Create.new(options)

    command.execute(output: output)

    assert_equal "OK\n", output.string
  end
end
