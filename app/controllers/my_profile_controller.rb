class MyProfileController < ApplicationController
  before_action :require_login
  before_action :set_current_driver

  def show
  end

  def edit
  end

  def update
    if @current_driver.update(driver_params)
      redirect_to my_profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private
  
  def set_current_driver
    @current_driver = current_user.driver
  end

  def driver_params
    params.require(:driver).permit(:alias, :dob, :country, :bio)
  end

  def user_params
    current_user.slice(:nickname, :name, :picture, :updated_at, :email, :email_verified, :sub)
  end
end