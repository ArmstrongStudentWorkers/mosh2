class JobStatusesController < ApplicationController
  # GET /job_statuses
  # GET /job_statuses.json
  def index
    @job_statuses = JobStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_statuses }
    end
  end

  # GET /job_statuses/1
  # GET /job_statuses/1.json
  def show
    @job_status = JobStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_status }
    end
  end

  # GET /job_statuses/new
  # GET /job_statuses/new.json
  def new
    @job_status = JobStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_status }
    end
  end

  # GET /job_statuses/1/edit
  def edit
    @job_status = JobStatus.find(params[:id])
  end

  # POST /job_statuses
  # POST /job_statuses.json
  def create
    @job_status = JobStatus.new(params[:job_status])

    respond_to do |format|
      if @job_status.save
        format.html { redirect_to @job_status, notice: 'Job status was successfully created.' }
        format.json { render json: @job_status, status: :created, location: @job_status }
      else
        format.html { render action: "new" }
        format.json { render json: @job_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_statuses/1
  # PUT /job_statuses/1.json
  def update
    @job_status = JobStatus.find(params[:id])

    respond_to do |format|
      if @job_status.update_attributes(params[:job_status])
        format.html { redirect_to @job_status, notice: 'Job status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_statuses/1
  # DELETE /job_statuses/1.json
  def destroy
    @job_status = JobStatus.find(params[:id])
    @job_status.destroy

    respond_to do |format|
      format.html { redirect_to job_statuses_url }
      format.json { head :no_content }
    end
  end
end
