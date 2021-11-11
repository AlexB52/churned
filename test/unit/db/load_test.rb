require 'test_helper'
require 'churned/commands/db/load'

class Churned::Commands::Db::LoadTest < Minitest::Test
  def test_executes_db_load_command_successfully
    output = StringIO.new
    options = {}
    command = Churned::Commands::Db::Load.new(options)

    command.execute(output: output)

    assert_equal "OK\n", output.string
  end
end
