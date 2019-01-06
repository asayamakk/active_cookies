require "test_helper"

class ModelTest < Minitest::Test

  def test_new
    user_setting = UserSetting.new(permit_cookies_use: true)
    assert user_setting.permit_cookies_use
  end

  def test_save
    user_setting = UserSetting.new(permit_cookies_use: true)
    user_setting.save
    assert user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]

    user_setting.permit_cookies_use = false
    user_setting.save
    refute user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]
  end

  def test_update
    user_setting = UserSetting.new(permit_cookies_use: false)
    refute user_setting.permit_cookies_use
    assert_empty user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]

    user_setting.update(permit_cookies_use: true)
    assert user_setting.permit_cookies_use
    assert user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]
  end

  def test_create
    user_setting = UserSetting.create(permit_cookies_use: true)
    assert user_setting.permit_cookies_use
    assert user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]
  end

  def test_destroy
    user_setting = UserSetting.create(permit_cookies_use: true)
    user_setting.destroy
    assert_empty user_setting.controller.cookie_jar[user_setting.cookie_key(:permit_cookies_use)]
  end

  def test_find
    UserSetting.create(permit_cookies_use: true)
    user_setting = UserSetting.find
    assert user_setting.permit_cookies_use
  end

end