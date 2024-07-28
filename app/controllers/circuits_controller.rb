class CircuitsController < ApplicationController
  def index
    @circuits = Circuit.all
  end

  def show
    @circuit = Circuit.find(params[:id])
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
    @circuit = Circuit.find(params[:id])
  end

  def update
    @circuit = Circuit.find(params[:id])

    if @circuit.update(circuit_params)
      redirect_to @circuit
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @circuit = Circuit.find(params[:id])
    @circuit.destroy

    redirect_to circuits_path, status: :unprocessable_entity
  end

  private

  def circuit_params
    params.require(:circuit).permit(:name, :opened, :website, :address, :description,
                tracks_attributes: [:id, :name, :location])
  end

end
