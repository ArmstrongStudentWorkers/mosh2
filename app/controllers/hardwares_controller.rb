class HardwaresController < ApplicationController
  # GET /hardwares
  # GET /hardwares.json
  def index
    @hardwares = Hardware.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hardwares }
    end
  end

  # GET /hardwares/1
  # GET /hardwares/1.json
  def show
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardware }
    end
  end

  # GET /hardwares/new
  # GET /hardwares/new.json
  def new
    @hardware = Hardware.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardware }
    end
  end

  # GET /hardwares/1/edit
  def edit
    @hardware = Hardware.find(params[:id])
  end

  # POST /hardwares
  # POST /hardwares.json
  def create
    @hardware = Hardware.new(params[:hardware])

    respond_to do |format|
      if @hardware.save
        format.html { redirect_to @hardware, notice: 'Hardware was successfully created.' }
        format.json { render json: @hardware, status: :created, location: @hardware }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardwares/1
  # PUT /hardwares/1.json
  def update
    @hardware = Hardware.find(params[:id])

    respond_to do |format|
      if @hardware.update_attributes(params[:hardware])
        format.html { redirect_to @hardware, notice: 'Hardware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardwares/1
  # DELETE /hardwares/1.json
  def destroy
    @hardware = Hardware.find(params[:id])
    @hardware.destroy

    respond_to do |format|
      format.html { redirect_to hardwares_url }
      format.json { head :no_content }
    end
  end
end
