# frozen_string_literal: true

require 'test_helper'

class GetTest < ActiveSupport::TestCase
  test 'calling Get class to test find notification based on user and id' do
    params = {
      notification: {
        title: 'title',
        content: 'content',
        importance: 1,
        day: DateTime.now,
        tag: 'info'
      },
      users: [User.first.email]
    }
    NotificationEngine::Notify::Create.call(params)
    notification = NotificationEngine::Notify::Get.call(User.first, Notification.first.id)
    assert_equal notification.title, 'title'
    assert_equal notification.user, User.first
  end
end
