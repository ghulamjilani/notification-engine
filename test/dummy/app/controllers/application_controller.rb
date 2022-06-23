# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_users)
    notifications_path
  end

  def after_sign_out_path_for(_users)
    root_url
  end
end
