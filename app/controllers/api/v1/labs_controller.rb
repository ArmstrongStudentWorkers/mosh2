class Api::V1::LabsController < ApplicationController

  def index
    @labs = LocationType.where(name: "Lab").first.locations
    respond_to do |format|
      format.json { render json: @labs }
    end
  end

  def show
    @lab = Location.find(params[:id])
    respond_to do |format|
      format.json { render json: @lab }
    end
  end
end
