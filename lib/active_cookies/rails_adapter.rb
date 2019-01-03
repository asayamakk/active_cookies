module ActiveCookies

  class RailsAdapter
    attr_reader :controller

    def initialize(controller)
      @controller = controller
    end

    def cookie_jar
      controller.cookies
    end

    def self.included(klass)
      klass.prepend_before_action :set_controller
    end

    private

    def set_controller
      ActiveCookies::Base.controller = new(self)
    end
  end
end

ApplicationController.send(:include, ActiveCookies::RailsAdapter)
