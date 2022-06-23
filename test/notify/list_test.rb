# frozen_string_literal: true

require 'test_helper'

class GetTest < ActiveSupport::TestCase
  user = User.create(email: 'sample@sample.com', password: '123456', password_confirmation: '123456')
  user.add_user_role('user')

  test 'calling List class to test notification list based on role=user' do
    params = {
      notification: {
        title: 'title',
        content: 'content',
        importance: 1,
        day: DateTime.now,
        tag: 'info'
      },
      users: [User.last.email]
    }
    NotificationEngine::Notify::Create.call(params)
    notifications = NotificationEngine::Notify::List.call(User.last)
    assert_equal notifications.count, 1
    assert_equal notifications.first.user, User.last
  end

  test 'calling List class to test notification list based on role=admin' do
    params = {
      notification: {
        title: 'title',
        content: 'content',
        importance: 1,
        day: DateTime.now,
        tag: 'info'
      },
      users: [User.last.email]
    }
    NotificationEngine::Notify::Create.call(params)
    User.first.roles.first.update(name: 'admin')
    notifications = NotificationEngine::Notify::List.call(User.first)
    assert_equal notifications.count, 1
    assert_equal notifications.first.user, User.last
  end
end
