class CircuitsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_circuit, except: [:index, :new, :create]

  def index
    @circuits = Circuit.all
  end

  def show
  end
  
  def new
    @circuit = Circuit.new
    @circuit.tracks.build
  end

  def create
    @circuit = Circuit.new(circuit_params)

    if @circuit.save
      redirect_to @circuit
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if @circuit.update(circuit_params)
      redirect_to @circuit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @circuit.destroy

    redirect_to circuits_path, status: :unprocessable_entity
  end

  private

  def set_circuit
    @circuit = Circuit.find(params[:id])
  end

  def circuit_params
    params.require(:circuit).permit(:name, :opened, :website, :address, :description,
                tracks_attributes: [:id, :name, :location])
  end

end
