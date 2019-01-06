module ActiveCookies

  class MockAdapter
    attr_reader :controller

    def initialize
    end

    def cookie_jar
      puts "cookie_jar!"
      @cookie_jar ||= MockCookieJar.new
    end

  end
end
