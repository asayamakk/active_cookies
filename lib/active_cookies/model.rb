module ActiveCookies
  module Model
    def self.included(klass)
      klass.class_eval do
        extend ClassMethods
        include InstanceMethods
      end
    end

    module ClassMethods

      def cookies_accessor(*attributes)
        attributes.each do |attribute|
          attr_accessor attribute
        end
        @attrs_on_cookies = attributes
      end

      def cookies_enum(enum_hash)

      end

      def cookie_key(attribute)
        "active_cookies_#{name}_#{attribute}"
      end

      def create(attribute_hash)
        new(attribute_hash).save
      end

    end

    module InstanceMethods
      def save
        attributes = self.class.instance_variable_get(:@attrs_on_cookies)
        controller_ref = controller
        attributes.each do |attribute|
          controller_ref.cookie_jar[cookie_key(attribute)] = send(attribute)
        end
      end

      def initialize(attribute_hash = {})
        assign_attribute(attribute_hash)
      end

      def update(attribute_hash)
        assign_attribute(attribute_hash)
        save
      end

      def assign_attribute(attribute_hash)
        attribute_hash.each do |key, val|
          send("#{key}=", val)
        end
      end

      def cookie_key(attribute)
        self.class.cookie_key(attribute)
      end
    end

  end
end
