# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  validates :title, :importance, :day, :tag, presence: true

  enum importance: {
    error: 0,
    info: 1,
    warning: 2
  }
end
