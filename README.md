# Notification Engine

Notification engine that'll allow a web application to send personal notifications to the single user or multiple users.

## Usage
The notification engine provides different methods that you can use in your controllers to trigger notification for the single or multiple users.

### Methods

```ruby
# app/controllers/notifications_controller.rb

class NotificationsController < ApplicationController
  def index
    @notifications = notification_list(current_user)
  end
  
  def show
    @notification = get_notification(current_user, params[:id])
  end
  
  def create
    @notification = create_notification(params)
  end
  
  def update
    update_notification(params, @notification)
  end

  def destroy
    delete_notifications(params)
  end
end
```

and params will look like this:


```ruby
params = {
  notification: {
    title: 'title',
    content: 'content',
    importance: 1,
    day: DateTime.now,
    tag: 'info'
  },
  users: ['email1', 'email2']
}
```

How to use my plugin.

## Instructions

- Ruby: >= 3.0.0
- Rails: >= 7.0.0
- SQlite3

download/clone the repository

```bash
$ cd notification_engine
$ bundle install
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "notification_engine"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install notification_engine
```

## Testing

- Using GUI

```bash
$ cd notification_engine/test/dummy
$ rails s
```

- Using test cases:

```bash
$ cd notification_engine
$ bin/test
```

