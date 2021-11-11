require 'test_helper'
require 'churned/commands/db/load'

class Churned::Commands::Db::LoadTest < Minitest::Test
  def test_executes_churned_db_help_load_command_successfully
    output = `churned db help load`
    expect_output = <<-OUT
Usage:
  churned load

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    assert_equal expected_output, output
  end
end
