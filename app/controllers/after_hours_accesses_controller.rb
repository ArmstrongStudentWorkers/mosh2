class AfterHoursAccessesController < ApplicationController
  # GET /after_hours_accesses
  # GET /after_hours_accesses.json
  def index

    @locations = LocationType.where(name: 'Lab').first.locations
    if params[:location]
      @location = Location.find(params[:location])
      @after_hours_accesses = AfterHoursAccess.where(location_id: @location.id)
    end



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @after_hours_accesses }
    end
  end

  # GET /after_hours_accesses/1
  # GET /after_hours_accesses/1.json
  def show
    @after_hours_access = AfterHoursAccess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @after_hours_access }
    end
  end

  # GET /after_hours_accesses/new
  # GET /after_hours_accesses/new.json
  def new
    @after_hours_access = AfterHoursAccess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @after_hours_access }
    end
  end

  # GET /after_hours_accesses/1/edit
  def edit
    @after_hours_access = AfterHoursAccess.find(params[:id])
  end

  # POST /after_hours_accesses
  # POST /after_hours_accesses.json
  def create
    @after_hours_access = AfterHoursAccess.new(params[:after_hours_access])

    respond_to do |format|
      if @after_hours_access.save
        format.html { redirect_to @after_hours_access, notice: 'After hours access was successfully created.' }
        format.json { render json: @after_hours_access, status: :created, location: @after_hours_access }
      else
        format.html { render action: "new" }
        format.json { render json: @after_hours_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /after_hours_accesses/1
  # PUT /after_hours_accesses/1.json
  def update
    @after_hours_access = AfterHoursAccess.find(params[:id])

    respond_to do |format|
      if @after_hours_access.update_attributes(params[:after_hours_access])
        format.html { redirect_to @after_hours_access, notice: 'After hours access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @after_hours_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /after_hours_accesses/1
  # DELETE /after_hours_accesses/1.json
  def destroy
    @after_hours_access = AfterHoursAccess.find(params[:id])
    @after_hours_access.destroy

    respond_to do |format|
      format.html { redirect_to after_hours_accesses_url }
      format.json { head :no_content }
    end
  end
end
