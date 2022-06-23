# frozen_string_literal: true

module NotificationEngine
  module Notify
    class Delete < Base
      attr_reader :notification_ids

      def initialize(params)
        @notification_ids = [params[:id]]
      end

      def call
        Notification.destroy(notification_ids)
      end
    end
  end
end
