class MyProfileController < ApplicationController
  before_action :require_login

  def show
  end

  private

  def user_params
    current_user.slice(:nickname, :name, :picture, :updated_at, :email, :email_verified, :sub)
  end
end
