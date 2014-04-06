class StudentEventsController < ApplicationController
  # GET /student_events
  # GET /student_events.json
  def index
    @student_events = StudentEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_events }
    end
  end

  # GET /student_events/1
  # GET /student_events/1.json
  def show
    @student_event = StudentEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_event }
    end
  end

  # GET /student_events/new
  # GET /student_events/new.json
  def new
    @student_event = StudentEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_event }
    end
  end

  # GET /student_events/1/edit
  def edit
    @student_event = StudentEvent.find(params[:id])
  end

  # POST /student_events
  # POST /student_events.json
  def create
    @student_event = StudentEvent.new(params[:student_event])

    respond_to do |format|
      if @student_event.save
        format.html { redirect_to @student_event, notice: 'Student event was successfully created.' }
        format.json { render json: @student_event, status: :created, location: @student_event }
      else
        format.html { render action: "new" }
        format.json { render json: @student_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_events/1
  # PUT /student_events/1.json
  def update
    @student_event = StudentEvent.find(params[:id])

    respond_to do |format|
      if @student_event.update_attributes(params[:student_event])
        format.html { redirect_to @student_event, notice: 'Student event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_events/1
  # DELETE /student_events/1.json
  def destroy
    @student_event = StudentEvent.find(params[:id])
    @student_event.destroy

    respond_to do |format|
      format.html { redirect_to student_events_url }
      format.json { head :no_content }
    end
  end
end
