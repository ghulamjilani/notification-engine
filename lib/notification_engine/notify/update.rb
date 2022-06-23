# frozen_string_literal: true

module NotificationEngine
  module Notify
    class Update < Base
      attr_accessor :title, :content, :importance, :day, :tag, :notification

      def initialize(params, notification)
        @notification = notification
        @title = params[:notification][:title]
        @content = params[:notification][:content]
        @importance = params[:notification][:importance].to_i
        @day = params[:notification][:day]
        @tag = params[:notification][:tag]
      end

      def call
        update_notification
      end

      private

      def update_notification
        notification.update(title: title, content: content, importance: importance, day: day, tag: tag)
      end
    end
  end
end
