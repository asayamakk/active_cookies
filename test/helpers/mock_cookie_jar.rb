module ActiveCookies
  class MockCookieJar < Hash

    def initialize(cookies = {})
      @set_cookies = {}
      @delete_cookies = {}
      super
      update(cookies)
    end

    def [](name)
      super(name.to_s)
    end

    def []=(key, options)
      options = {value: options} unless options.is_a?(Hash)

      options[:path] ||= '/'
      @set_cookies[key] = options
      super(key.to_s, options[:value])
    end

    def delete(key, options = {})
      options[:path] ||= '/'
      @delete_cookies[key] = options
      super(key.to_s)
    end

  end
end