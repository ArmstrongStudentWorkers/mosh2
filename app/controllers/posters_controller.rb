class PostersController < ApplicationController
  before_filter :authenticate_user!

  # GET /posters
  # GET /posters.json
  def index
    @poster_statuses = PosterStatus.all

    if params[:poster_status]
      @poster_status = PosterStatus.find(params[:poster_status])
      @posters = @poster_status.posters.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posters }
    end
  end

  # GET /posters/1
  # GET /posters/1.json
  def show
    @poster = Poster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poster }
    end
  end

  # GET /posters/new
  # GET /posters/new.json
  def new
    @job = Job.find(params[:job_id])
    @poster = Poster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poster }
    end
  end

  # GET /posters/1/edit
  def edit
    @poster = Poster.find(params[:id])
  end

  # POST /posters
  # POST /posters.json
  def create
    @job = Job.find(params[:job_id])
    @poster = @job.posters.new(params[:poster])
    @poster.set_pending

    respond_to do |format|
      if @poster.save
        if params[:poster][:mounting] == true
          @date = @poster.job.format_date
          PosterMailer.mount_poster(@poster.id, @date, @poster.name, @poster.job.user.email).deliver
        end
        format.html { redirect_to @poster, notice: 'Poster was successfully created.' }
        format.json { render json: @poster, status: :created, location: @poster }
      else
        format.html { render action: "new" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posters/1
  # PUT /posters/1.json
  def update
    @poster = Poster.find(params[:id])

    if params[:poster][:denial]
      @poster.set_denied
    end
    respond_to do |format|
      if @poster.update_attributes(params[:poster])
        if @poster.denial
          PosterMailer.poster_denial(@poster, @poster.name, current_user.id, @poster.denial).deliver
        end
        format.html { redirect_to @poster, notice: 'Poster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  def print
    @poster = Poster.find(params[:poster_id])
    @poster.set_printing

    if @poster.save
      redirect_to @poster, notice: 'Poster is printing.'
    else
      redirect_to @poster, notice: 'Poster status could not be set to Printing.'
    end
  end

  def finish
    @poster = Poster.find(params[:poster_id])
    @poster.set_finished

    if @poster.save
      redirect_to @poster.job, notice: 'Poster was successfully finished.'
    else
      redirect_to @poster, notice: 'Poster could not be finished.'
    end
  end

  def pend
    @poster = Poster.find(params[:poster_id])
    @poster.set_pending
    @poster.denial = nil

    if @poster.save
      redirect_to @poster, notice: 'Poster is pending.'
    else
      redirect_to @poster, notice: 'Poster could not be pended.'
    end
  end

  # DELETE /posters/1
  # DELETE /posters/1.json
  def destroy
    @poster = Poster.find(params[:id])
    @poster.destroy

    respond_to do |format|
      format.html { redirect_to posters_url }
      format.json { head :no_content }
    end
  end
end
