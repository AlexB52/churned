require 'test_helper'
require 'churned/commands/install'

class Churned::Commands::InstallTest < Minitest::Test
  def test_executes_churned_help_install_command_successfully
    output = `churned help install`
    expected_output = <<-OUT
Usage:
  churned install

Options:
  -h, [--help], [--no-help]  # Display usage information

Creates the '.churned' working directory
    OUT

    assert_equal expected_output, output
  end
end
