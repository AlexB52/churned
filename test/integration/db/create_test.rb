require 'test_helper'
require 'churned/commands/db/create'

class Churned::Commands::Db::CreateTest < Minitest::Test
  def test_executes_churned_db_help_create_command_successfully
    output = `churned db help create`
    expect_output = <<-OUT
Usage:
  churned create

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    assert_equal expected_output, output
  end
end
