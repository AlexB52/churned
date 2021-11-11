require 'test_helper'
require 'churned/commands/install'

class Churned::Commands::InstallTest < Minitest::Test
  def test_executes_install_command_successfully
    output = StringIO.new
    options = {}
    command = Churned::Commands::Install.new(options)

    command.execute(output: output)

    assert_equal "", output.string
  end
end
