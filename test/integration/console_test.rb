require 'test_helper'
require 'churned/commands/console'

class Churned::Commands::ConsoleTest < Minitest::Test
  def test_executes_churned_help_console_command_successfully
    output = `churned help console`
    expected_output = <<-OUT
Usage:
  churned console

Options:
  -h, [--help], [--no-help]  # Display usage information

Open a irb session to read the database
    OUT

    assert_equal expected_output, output
  end
end
