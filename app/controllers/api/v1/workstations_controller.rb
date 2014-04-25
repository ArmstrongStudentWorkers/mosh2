class Api::V1::WorkstationsController < ApplicationController

  def index
    @workstations = Location.find(params[:lab_id]).workstations

    respond_to do |format|
      format.json { render json: @workstations }
    end
  end

  def show
    @workstation = Workstation.find(params[:id])

    respond_to do |format|
      format.json { render json: @workstation }
    end
  end
end
