# frozen_string_literal: true

module NotificationEngine
  module Notify
    class FindByTag < Base
      attr_reader :user, :tag

      def initialize(user, tag)
        @user = user
        @tag = tag
      end

      def call
        notification
      end

      private

      def notification
        notifications = NotificationEngine::Notify::List.call(user)
        notifications.find_by(tag: tag, user_id: user.id)
      end
    end
  end
end
