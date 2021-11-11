require "test_helper"

class ChurnedTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Churned::VERSION
  end
end
