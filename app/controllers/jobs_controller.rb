class JobsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /jobs
  # GET /jobs.json
  def index
    if !current_user.management
      @jobs = Job.where(user_id: current_user.id).page(params[:page])
    else
      @jobs = Job.page(params[:page])
    end
    @job_statuses = JobStatus.all

    if params[:job_status]
      @job_status = JobStatus.find(params[:job_status])
      if !current_user.management
        @jobs = @job_status.jobs.where(user_id: current_user.id).page(params[:page])
      else
        @jobs = @job_status.jobs.page(params[:page])
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    if !params[:job][:user_id]
      @job.user_id = current_user.id
    end
    @job.set_pending
    @job.due_date = DateTime.strptime(params[:job][:due_date], '%m/%d/%Y').to_date
    @job.finalize = false;

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])
    if params[:job][:due_date]
      params[:job][:due_date] = DateTime.strptime(params[:job][:due_date], '%m/%d/%Y').to_date
      puts params[:job][:due_date]
    end
    if params[:job][:denial]
      puts 'in denial block'
      @job.set_denied
    end

    respond_to do |format|
      if @job.update_attributes(params[:job])
        if @job.denial
          PosterMailer.job_denial(@job.id, current_user.id, @job.denial).deliver
        end
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def finalize
    @job = Job.find(params[:job_id])
    @job.set_finalize

    if @job.save
      @date = @job.format_date
      @posters = @job.posters
      PosterMailer.new_job(@job.id, current_user.id, @date, @posters).deliver
      PosterMailer.new_job_alert(@job.user.id, @date, @job.id).deliver

      redirect_to @job, notice: 'Your job was finalized.'
    else
      redirect_to @job, notice: 'Your job could not be finalized.'
    end
  end

  def finish
    @job = Job.find(params[:job_id])
    @job.set_finished

    if @job.save
      PosterMailer.job_finished(@job.id, @job.user.id).deliver
      PosterMailer.job_finished_alert(@job.id, @job.user.id).deliver
      redirect_to @job, notice: 'Job was successfully finished.'
    else
      redirect_to @job, notice: 'Job could not be finished.'
    end
  end

  def pend
    @job = Job.find(params[:job_id])
    @job.set_pending
    @job.denial = nil

    if @job.save
      redirect_to @job, notice: 'Job is pending.'
    else
      redirect_to @job, notice: 'Job could not be pended.'
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
end
