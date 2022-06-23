# frozen_string_literal: true

module NotificationEngine
  module Notify
    class Base
      def self.call(*args, &block)
        new(*args, &block).call
      end
    end
  end
end
