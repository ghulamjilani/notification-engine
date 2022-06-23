# frozen_string_literal: true

require 'test_helper'

class FindByTagTest < ActiveSupport::TestCase
  test 'call method to test find notification based on tag' do
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
    notification = NotificationEngine::Notify::FindByTag.call(User.first, Notification.first.tag)
    assert_equal notification.tag, 'info'
  end
end
