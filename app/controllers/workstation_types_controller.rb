class WorkstationTypesController < ApplicationController

require "#{Rails.root}/lib/mosh_modules/management_module"
include MoshModules::ManagementModule
before_filter :management_filter

  # GET /workstation_types
  # GET /workstation_types.json
  def index
    @workstation_types = WorkstationType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workstation_types }
    end
  end

  # GET /workstation_types/1
  # GET /workstation_types/1.json
  def show
    @workstation_type = WorkstationType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workstation_type }
    end
  end

  # GET /workstation_types/new
  # GET /workstation_types/new.json
  def new
    @workstation_type = WorkstationType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workstation_type }
    end
  end

  # GET /workstation_types/1/edit
  def edit
    @workstation_type = WorkstationType.find(params[:id])
  end

  # POST /workstation_types
  # POST /workstation_types.json
  def create
    @workstation_type = WorkstationType.new(params[:workstation_type])

    respond_to do |format|
      if @workstation_type.save
        format.html { redirect_to @workstation_type, notice: 'Workstation type was successfully created.' }
        format.json { render json: @workstation_type, status: :created, location: @workstation_type }
      else
        format.html { render action: "new" }
        format.json { render json: @workstation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workstation_types/1
  # PUT /workstation_types/1.json
  def update
    @workstation_type = WorkstationType.find(params[:id])

    respond_to do |format|
      if @workstation_type.update_attributes(params[:workstation_type])
        format.html { redirect_to @workstation_type, notice: 'Workstation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workstation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workstation_types/1
  # DELETE /workstation_types/1.json
  def destroy
    @workstation_type = WorkstationType.find(params[:id])
    @workstation_type.destroy

    respond_to do |format|
      format.html { redirect_to workstation_types_url }
      format.json { head :no_content }
    end
  end
end
