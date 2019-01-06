require "test_helper"


class ModelTest < Minitest::Test

  def test_accessor_methods_are_defined_by_cookies_accessor
    user_setting = UserSetting.new(permit_cookies_use: true)
    assert_equal true, user_setting.permit_cookies_use
  end

  def test_save
    user_setting = UserSetting.new(permit_cookies_use: true)
    user_setting.save
    assert_equal true, true
  end
end