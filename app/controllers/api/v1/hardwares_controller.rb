class Api::V1::HardwaresController < ApplicationController

  def index
    @hardwares = Workstation.find(params[:workstation_id]).hardwares

    respond_to do |format|
      format.json { render json: @hardwares }
    end
  end

  def show
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      format.json { render json: @hardware }
    end
  end
end

