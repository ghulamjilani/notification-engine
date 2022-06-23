# frozen_string_literal: true

module NotificationEngine
  module Notify
    class Create < Base
      attr_accessor :params, :title, :content, :importance, :day, :tag, :users

      def initialize(params)
        @params = params
        @title = params[:notification][:title]
        @content = params[:notification][:content]
        @importance = params[:notification][:importance].to_i
        @day = params[:notification][:day]
        @tag = params[:notification][:tag]
        @users = params[:users]
      end

      def call
        create_notification
      end

      private

      def create_notification
        users = User.where(email: @users)
        users.each do |user|
          notification = NotificationEngine::Notify::FindByTag.call(user, tag)
          if notification.present?
            NotificationEngine::Notify::Update.call(params, notification)
          else
            Notification.create(title: title, content: content, importance: importance, day: day, tag: tag, user: user)
          end
        end
      end
    end
  end
end
