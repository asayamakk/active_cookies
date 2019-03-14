module ActiveCookies

  class RailsAdapter
    attr_reader :controller

    def initialize(controller)
      @controller = controller
    end

    def cookie_jar
      controller.send(:cookies).signed
    end


  end

  module RailsInitializer
    def self.included(klass)
      klass.prepend_before_action :initialize_active_cookies
    end

    private

    def initialize_active_cookies
      ActiveCookies::Base.controller = RailsAdapter.new(self)
    end
  end
end

::ActionController::Base.send(:include, ActiveCookies::RailsInitializer)
