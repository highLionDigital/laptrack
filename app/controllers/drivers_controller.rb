class DriversController < ApplicationController
  before_action :require_login
  
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

end
