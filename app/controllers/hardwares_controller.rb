class HardwaresController < ApplicationController

  require "#{Rails.root}/lib/mosh_modules/management_module"
  include MoshModules::ManagementModule
  before_filter :management_filter

  def index
    if params[:workstation_id]
      @hardwares = Workstation.find(params[:workstation_id]).hardwares
    end
    @hardwares ||= Hardware.page(params[:page])
  end

  def show
    @hardware = Hardware.find(params[:id])
  end

  def new
    @workstation = Workstation.find(params[:workstation_id])
    @hardware = Hardware.new
  end

  def edit
    @hardware = Hardware.find(params[:id])
  end

  def create
    workstation = Workstation.find(params[:workstation_id])
    @hardware = workstation.hardwares.new(params[:hardware])
    @hardware.name_hardware

    if @hardware.save
      redirect_to @hardware, notice: 'Hardware was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @hardware = Hardware.find(params[:id])

    if @hardware.update_attributes(params[:hardware])
      redirect_to @hardware, notice: 'Hardware was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy

    redirect_to hardwares_url
  end
end
