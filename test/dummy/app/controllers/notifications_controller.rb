# frozen_string_literal: true

class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_notification, only: %i[edit update]

  def index
    @notifications = notification_list(current_user)
  end

  def new
    @notification = Notification.new
  end

  def edit; end

  def create
    @notification = create_notification(params)
    if @notification.present?
      redirect_to notifications_path, notice: 'Notification was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if update_notification(params, @notification)
      redirect_to notifications_path, notice: 'Notification was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_all
    delete_notifications(params)
    redirect_to notifications_url, notice: 'Notifications was successfully destroyed.'
  end

  private

  def set_notification
    @notification = get_notification(current_user, params[:id])
  end

  def notification_params
    params.require(:notification).permit(:title, :content, :importance, :day, :tag, users: [])
  end
end
