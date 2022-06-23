# frozen_string_literal: true

module NotificationEngine
  module Notify
    class List < Base
      attr_reader :user

      def initialize(user)
        @user = user
      end

      def call
        collection
      end

      private

      def collection
        user.admin? ? Notification.all : user.notifications
      end
    end
  end
end
