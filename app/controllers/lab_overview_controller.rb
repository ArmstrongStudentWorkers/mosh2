class LabOverviewController < ApplicationController
  def index
    @locations = LocationType.where(name: 'Lab').first.locations
    if params[:location]
      @location = Location.find(params[:location])
    end
  end
end
