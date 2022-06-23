# frozen_string_literal: true

module NotificationEngine
  # Controller
  module Controller
    private

    def notification_list(user)
      NotificationEngine::Notify::List.call(user)
    end

    def get_notification(user, params)
      NotificationEngine::Notify::Get.call(user, params)
    end

    def create_notification(params)
      NotificationEngine::Notify::Create.call(params)
    end

    def update_notification(params, notification)
      NotificationEngine::Notify::Update.call(params, notification)
    end

    def delete_notifications(params)
      NotificationEngine::Notify::Delete.call(params)
    end
  end
end
