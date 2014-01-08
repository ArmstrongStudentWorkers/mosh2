class LocationTypesController < ApplicationController

require "#{Rails.root}/lib/mosh_modules/management_module"
include MoshModules::ManagementModule
before_filter :management_filter

  # GET /location_types
  # GET /location_types.json
  def index
    @location_types = LocationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @location_types }
    end
  end

  # GET /location_types/1
  # GET /location_types/1.json
  def show
    @location_type = LocationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location_type }
    end
  end

  # GET /location_types/new
  # GET /location_types/new.json
  def new
    @location_type = LocationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location_type }
    end
  end

  # GET /location_types/1/edit
  def edit
    @location_type = LocationType.find(params[:id])
  end

  # POST /location_types
  # POST /location_types.json
  def create
    @location_type = LocationType.new(params[:location_type])

    respond_to do |format|
      if @location_type.save
        format.html { redirect_to @location_type, notice: 'Location type was successfully created.' }
        format.json { render json: @location_type, status: :created, location: @location_type }
      else
        format.html { render action: "new" }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /location_types/1
  # PUT /location_types/1.json
  def update
    @location_type = LocationType.find(params[:id])

    respond_to do |format|
      if @location_type.update_attributes(params[:location_type])
        format.html { redirect_to @location_type, notice: 'Location type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_types/1
  # DELETE /location_types/1.json
  def destroy
    @location_type = LocationType.find(params[:id])
    @location_type.destroy

    respond_to do |format|
      format.html { redirect_to location_types_url }
      format.json { head :no_content }
    end
  end
end
