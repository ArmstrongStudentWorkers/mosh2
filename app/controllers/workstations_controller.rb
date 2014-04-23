class WorkstationsController < ApplicationController

  require "#{Rails.root}/lib/mosh_modules/management_module"
  include MoshModules::ManagementModule
  before_filter :management_filter

  def index
    if params[:location_id]
      @workstations = Location.find(params[:location_id]).workstations.page(params[:page])
    end
      @workstations ||= Workstation.page(params[:page])
  end

  def show
    @workstation = Workstation.find(params[:id])
  end

  def new
    @location = Location.find(params[:location_id])
    @workstation = Workstation.new
  end

  def edit
    @workstation = Workstation.find(params[:id])
  end

  def create
    location = Location.find(params[:location_id])
    @workstation = location.workstations.new(params[:workstation])
    @workstation.name_workstation

    if @workstation.save
      redirect_to @workstation, notice: 'Workstation was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @workstation = Workstation.find(params[:id])

    if @workstation.update_attributes(params[:workstation])
      redirect_to @workstation, notice: 'Workstation was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @workstation = Workstation.find(params[:id])
    @workstation.destroy

    redirect_to workstations_url
  end
end
