# require 'active_support'
# require "active_support/test_case"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "active_cookies"
require "helpers/mock_adapter"
require "helpers/mock_cookie_jar"
require "classes/user_setting"

require "minitest/autorun"

module MyMinitestPlugin
  def before_setup
    super
    ActiveCookies::Base.controller = ActiveCookies::MockAdapter.new
  end
end

class MiniTest::Test
  include MyMinitestPlugin
end
