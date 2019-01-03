require 'request_store'


require 'active_cookies/model'
require 'active_cookies/session'
require 'active_cookies/base'
require 'active_cookies/version'

module ActiveCookies
  class Error < StandardError; end
end

require 'active_cookies/rails_adapter' if defined? Rails
