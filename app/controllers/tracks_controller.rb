class TracksController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_circuit, only: [:index, :new, :create]

  def index
    @tracks = @circuit ? @circuit.tracks.includes(:circuit, :races => :driver) : Track.includes(:circuit, :races => :driver)
    @tracks = @tracks.order('circuits.name', :name)
    @best_times = Race.select('track_id, MIN(best_lap_time) as best_lap_time')
                      .group(:track_id)
                      .index_by(&:track_id)
    respond_to do |format|
      format.html
      format.json { render json: @tracks }
    end
  end

  def show
    @track = Track.find(params[:id])
    @races = Race.where(track_id: @track.id)
  end

  def new
    @track = @circuit.tracks.build
  end

  def create
    @track = @circuit.tracks.build(track_params)

    if @track.save
      redirect_to @circuit
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_circuit
    @circuit = Circuit.find(params[:circuit_id]) if params[:circuit_id]
  end

  def track_params
    params.require(:track).permit(:name, :location)
  end
end