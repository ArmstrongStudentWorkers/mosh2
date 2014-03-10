class HardwareTypesController < ApplicationController

require "#{Rails.root}/lib/mosh_modules/management_module"
include MoshModules::ManagementModule
before_filter :management_filter

  # GET /hardware_types
  # GET /hardware_types.json
  def index

    respond_to do |format|
      format.html do @hardware_types = HardwareType.page(params[:page]) end # index.html.erb
      format.json do
        @hardware_types = HardwareType.all
        render json: @hardware_types
      end
    end
  end

  # GET /hardware_types/1
  # GET /hardware_types/1.json
  def show
    @hardware_type = HardwareType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardware_type }
    end
  end

  # GET /hardware_types/new
  # GET /hardware_types/new.json
  def new
    @hardware_type = HardwareType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardware_type }
    end
  end

  # GET /hardware_types/1/edit
  def edit
    @hardware_type = HardwareType.find(params[:id])
  end

  # POST /hardware_types
  # POST /hardware_types.json
  def create
    @hardware_type = HardwareType.new(params[:hardware_type])

    respond_to do |format|
      if @hardware_type.save
        format.html { redirect_to @hardware_type, notice: 'Hardware type was successfully created.' }
        format.json { render json: @hardware_type, status: :created, location: @hardware_type }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardware_types/1
  # PUT /hardware_types/1.json
  def update
    @hardware_type = HardwareType.find(params[:id])

    respond_to do |format|
      if @hardware_type.update_attributes(params[:hardware_type])
        format.html { redirect_to @hardware_type, notice: 'Hardware type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardware_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_types/1
  # DELETE /hardware_types/1.json
  def destroy
    @hardware_type = HardwareType.find(params[:id])
    @hardware_type.destroy

    respond_to do |format|
      format.html { redirect_to hardware_types_url }
      format.json { head :no_content }
    end
  end
end
