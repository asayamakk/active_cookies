module ActiveCookies
  module Session

    def self.included(klass)
      klass.class_eval do
        extend ClassMethods
        include InstanceMethods
      end
    end

    module ClassMethods
      def controller=(controller)
        RequestStore.store[:active_cookies_controller] = controller
      end

      def controller
        RequestStore.store[:active_cookies_controller]
      end
    end

    module InstanceMethods
      def controller
        self.class.controller
      end
    end
  end
end