# frozen_string_literal: true

module NotificationEngine
  module Notify
    class Get < Base
      attr_reader :user, :notification_id

      def initialize(user, id)
        @user = user
        @notification_id = id
      end

      def call
        notification
      end

      private

      def notification
        notifications = NotificationEngine::Notify::List.call(user)
        notifications.find(notification_id)
      end
    end
  end
end
