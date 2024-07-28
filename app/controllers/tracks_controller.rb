class TracksController < ApplicationController
  before_action :set_circuit, except: :show

  def index
    @tracks = @circuit ? @circuit.tracks : Track.all
  end

  def show
    @track = Track.find(params[:id])
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
