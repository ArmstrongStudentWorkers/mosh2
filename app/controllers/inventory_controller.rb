class InventoryController < ApplicationController
  def index
    @locations = Location.all
    if params[:location]
      @location = Location.find(params[:location])
    end
  end
end
