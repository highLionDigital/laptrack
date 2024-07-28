class TracksController < ApplicationController
  def new
    @track = Track.new
    @circuit = @track.circuit
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to @circuit
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :location)
  end
end
