# frozen_string_literal: true

class UserSetting < ActiveCookies::Base
  cookies_accessor :permit_cookies_use
  cookies_enum theme_color: {red: 1, blue: 2, yellow: 3}
end
