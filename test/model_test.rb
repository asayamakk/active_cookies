require "test_helper"

class ModelTest < Minitest::Test

  def test_accessor_methods_are_defined_by_cookies_accessor
    user_setting = UserSetting.new(permit_cookies_use: true)
    assert user_setting.permit_cookies_use
  end

  def test_save_to_cookies
    user_setting = UserSetting.new(permit_cookies_use: true)
    user_setting.save
    assert user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]
  end
end