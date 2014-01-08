class HardwareStatusesController < ApplicationController

require "#{Rails.root}/lib/mosh_modules/management_module"
include MoshModules::ManagementModule
before_filter :management_filter

  # GET /hardware_statuses
  # GET /hardware_statuses.json
  def index
    @hardware_statuses = HardwareStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hardware_statuses }
    end
  end

  # GET /hardware_statuses/1
  # GET /hardware_statuses/1.json
  def show
    @hardware_status = HardwareStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardware_status }
    end
  end

  # GET /hardware_statuses/new
  # GET /hardware_statuses/new.json
  def new
    @hardware_status = HardwareStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardware_status }
    end
  end

  # GET /hardware_statuses/1/edit
  def edit
    @hardware_status = HardwareStatus.find(params[:id])
  end

  # POST /hardware_statuses
  # POST /hardware_statuses.json
  def create
    @hardware_status = HardwareStatus.new(params[:hardware_status])

    respond_to do |format|
      if @hardware_status.save
        format.html { redirect_to @hardware_status, notice: 'Hardware status was successfully created.' }
        format.json { render json: @hardware_status, status: :created, location: @hardware_status }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardware_statuses/1
  # PUT /hardware_statuses/1.json
  def update
    @hardware_status = HardwareStatus.find(params[:id])

    respond_to do |format|
      if @hardware_status.update_attributes(params[:hardware_status])
        format.html { redirect_to @hardware_status, notice: 'Hardware status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardware_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_statuses/1
  # DELETE /hardware_statuses/1.json
  def destroy
    @hardware_status = HardwareStatus.find(params[:id])
    @hardware_status.destroy

    respond_to do |format|
      format.html { redirect_to hardware_statuses_url }
      format.json { head :no_content }
    end
  end
end
