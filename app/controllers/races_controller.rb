class RacesController < ApplicationController
  before_action :require_login
  before_action :authorize_driver, only: [:create]
  before_action :authorize_race, only: [:destroy]

  def new
    @race = Race.new
    if params[:track_id]
      @track = Track.find(params[:track_id])
      @race.track = @track
      @circuit = @track.circuit
    end
  end

  def create
    @race = Race.new(race_params)
    @race.driver = current_user.driver

    if @race.save
      redirect_to track_path(@race.track), notice: 'Race was successfully added.'
    else
      Rails.logger.debug "Race errors: #{@race.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def race_params
    params.require(:race).permit(:driver_id, :track_id, :start_time,
                                :total_laps, :best_lap_time, :avg_lap_time)
  end

  def authorize_driver
    redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.driver
  end

  def authorize_race
    @race = Race.find(params[:id])
    unless @race.driver == current_user.driver
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end