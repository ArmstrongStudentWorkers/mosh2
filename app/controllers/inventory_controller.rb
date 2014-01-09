class InventoryController < ApplicationController

require "#{Rails.root}/lib/mosh_modules/management_module"
include MoshModules::ManagementModule
before_filter :management_filter

  def index
    if params[:search_type]
      search_type = params[:search_type]
      if search_type == 'Location'
        @location = Location.find(params[:select])
      elsif search_type == 'Status'
        @hardware_status = HardwareStatus.find(params[:select])
      elsif search_type == 'Type'
        @hardware_type = HardwareType.find(params[:select])
      end
    end
  end
end
