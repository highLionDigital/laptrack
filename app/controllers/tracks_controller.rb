class TracksController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_circuit, only: [:index]

  def index
    @tracks = @circuit ? @circuit.tracks : Track.all
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