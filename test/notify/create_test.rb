# frozen_string_literal: true

require 'test_helper'

class CreateTest < ActiveSupport::TestCase
  test 'call method to test create notification' do
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
    assert_equal Notification.first.title, 'title'
    assert_equal Notification.first.user, User.first
  end

  test 'update notification that have same tag' do
    params = {
      notification: {
        title: 'sample',
        content: 'sample content',
        importance: 1,
        day: DateTime.now,
        tag: 'info'
      },
      users: [User.first.email]
    }
    NotificationEngine::Notify::Create.call(params)
    assert_equal Notification.first.title, 'sample'
    assert_equal Notification.first.content, 'sample content'
    assert_equal Notification.first.user, User.first
  end
end
