require "test_helper"

class ActiveCookiesTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveCookies::VERSION
  end
end
