require 'test_helper'
require 'churned/commands/console'

class Churned::Commands::ConsoleTest < Minitest::Test
  def test_executes_console_command_successfully
    output = StringIO.new
    options = {}
    out, err = capture_io do
      Churned::Commands::Console.new(options).execute(output: output)
    end
  end
end
