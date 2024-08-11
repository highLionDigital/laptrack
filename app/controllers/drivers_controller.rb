class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

end
