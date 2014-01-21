class PosterStatusesController < ApplicationController
  # GET /poster_statuses
  # GET /poster_statuses.json
  def index
    @poster_statuses = PosterStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poster_statuses }
    end
  end

  # GET /poster_statuses/1
  # GET /poster_statuses/1.json
  def show
    @poster_status = PosterStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poster_status }
    end
  end

  # GET /poster_statuses/new
  # GET /poster_statuses/new.json
  def new
    @poster_status = PosterStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poster_status }
    end
  end

  # GET /poster_statuses/1/edit
  def edit
    @poster_status = PosterStatus.find(params[:id])
  end

  # POST /poster_statuses
  # POST /poster_statuses.json
  def create
    @poster_status = PosterStatus.new(params[:poster_status])

    respond_to do |format|
      if @poster_status.save
        format.html { redirect_to @poster_status, notice: 'Poster status was successfully created.' }
        format.json { render json: @poster_status, status: :created, location: @poster_status }
      else
        format.html { render action: "new" }
        format.json { render json: @poster_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poster_statuses/1
  # PUT /poster_statuses/1.json
  def update
    @poster_status = PosterStatus.find(params[:id])

    respond_to do |format|
      if @poster_status.update_attributes(params[:poster_status])
        format.html { redirect_to @poster_status, notice: 'Poster status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poster_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poster_statuses/1
  # DELETE /poster_statuses/1.json
  def destroy
    @poster_status = PosterStatus.find(params[:id])
    @poster_status.destroy

    respond_to do |format|
      format.html { redirect_to poster_statuses_url }
      format.json { head :no_content }
    end
  end
end
