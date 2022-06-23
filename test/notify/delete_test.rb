# frozen_string_literal: true

require 'test_helper'

class DeleteTest < ActiveSupport::TestCase
  test 'call method to test delete notification' do
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
    NotificationEngine::Notify::Delete.call({ id: Notification.first.id })
    assert_nil Notification.first
  end
end
