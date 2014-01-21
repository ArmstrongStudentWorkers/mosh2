class PostersController < ApplicationController
  # GET /posters
  # GET /posters.json
  def index
    @posters = Poster.all

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
    @poster = Poster.new(params[:poster])

    respond_to do |format|
      if @poster.save
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

    respond_to do |format|
      if @poster.update_attributes(params[:poster])
        format.html { redirect_to @poster, notice: 'Poster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
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
