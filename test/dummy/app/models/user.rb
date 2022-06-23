# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, dependent: :destroy

  ROLES = %w[admin user].freeze

  after_create :create_role

  def create_role
    add_user_role('user')
  end

  def add_user_role(role)
    add_role(role) if ROLES.include?(role) && role_not_exists?
  end

  def role_not_exists?
    roles.present? ? false : true
  end

  def user?
    has_role? 'user'
  end

  def admin?
    has_role? 'admin'
  end
end
