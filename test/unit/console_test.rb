require 'test_helper'
require 'churned/commands/console'

class Churned::Commands::ConsoleTest < Minitest::Test
  def test_executes_console_command_successfully
    output = StringIO.new
    options = {}
    command = Churned::Commands::Console.new(options)

    command.execute(output: output)

    assert_equal "OK\n", output.string
  end
end
