require 'test_helper'
require 'churned/commands/db'

class Churned::Commands::DbTest < Minitest::Test
  def test_executes_churned_help_db_command_successfully
    output = `churned help db`
    expected_output = <<-OUT
Commands:
    OUT

    assert_equal expected_output, output
  end
end
