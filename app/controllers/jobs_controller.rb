class JobsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /jobs
  # GET /jobs.json
  def index

    @per_page = params[:per_page] || 25
    if !current_user.management
      @jobs = Job.where(user_id: current_user.id)
                .search(params[:search])
                .order(sort_column + " " + sort_direction)
                .paginate(:per_page => @per_page, :page => params[:page])
      @isManagement = false
    else
      @jobs = Job.search(params[:search])
                .order("#{sort_column} #{sort_direction}")
                .paginate(:per_page => @per_page, :page => params[:page])
      @isManagement = true
    end
    @job_statuses = JobStatus.all

    if params[:job_status]
      @job_status = JobStatus.find(params[:job_status])
      if !current_user.management
        @jobs = @job_status.jobs.where(user_id: current_user.id)
                          .order(sort_column + " " + sort_direction)
                          .paginate(:per_page =>@per_page, :page => params[:page])
      else
        @jobs = @job_status.jobs.order(sort_column + " " + sort_direction)
                          .paginate(:per_page =>@per_page, :page => params[:page])
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

    if authorized_user?(current_user, @job)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @job }
      end
    else
      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
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
      @user = current_user
      @job.user_id = @user.id
    else
      @user = User.find(params[:job][:user_id])
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
      PosterMailer.new_job(@job.id, current_user.id, @date, @posters, @job.get_mounting).deliver
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

  private
  def sort_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def authorized_user?(user, job)
    user == job.user || user.management
  end

  def set_number_of_entries_per_page(number)

  end
end
