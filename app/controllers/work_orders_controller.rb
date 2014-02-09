class WorkOrdersController < ApplicationController
  # GET /work_orders
  # GET /work_orders.json
  def index
    @work_orders = WorkOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_orders }
    end
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_order }
    end
  end

  # GET /work_orders/new
  # GET /work_orders/new.json
  def new
    @work_order = WorkOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = WorkOrder.new(params[:work_order])
    @work_order.closed_date = DateTime.strptime[:work_order][:closed_date], '%m/%d/%Y').to_date

  respond_to do |format|
      if @work_order.save
        format.html { redirect_to @work_order, notice: 'Work order was successfully created.' }
        format.json { render json: @work_order, status: :created, location: @work_order }
      else
        format.html { render action: "new" }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.json
  def update
    @work_order = WorkOrder.find(params[:id])
    @work_order.closed_date = DateTime.strptime[:work_order][:closed_date], '%m/%d/%Y').to_date

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to @work_order, notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to work_orders_url }
      format.json { head :no_content }
    end
  end
end
