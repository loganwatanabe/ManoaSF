class YummyTummyDayOrdersController < ApplicationController
  # GET /yummy_tummy_day_orders
  # GET /yummy_tummy_day_orders.json
  def index
    @yummy_tummy_day_orders = YummyTummyDayOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yummy_tummy_day_orders }
    end
  end

  # GET /yummy_tummy_day_orders/1
  # GET /yummy_tummy_day_orders/1.json
  def show
    @yummy_tummy_day_order = YummyTummyDayOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yummy_tummy_day_order }
    end
  end

  # GET /yummy_tummy_day_orders/new
  # GET /yummy_tummy_day_orders/new.json
  def new
    @yummy_tummy_day_order = YummyTummyDayOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yummy_tummy_day_order }
    end
  end

  # GET /yummy_tummy_day_orders/1/edit
  def edit
    @yummy_tummy_day_order = YummyTummyDayOrder.find(params[:id])
  end

  # POST /yummy_tummy_day_orders
  # POST /yummy_tummy_day_orders.json
  def create
    @yummy_tummy_day_order = YummyTummyDayOrder.new(params[:yummy_tummy_day_order])

    respond_to do |format|
      if @yummy_tummy_day_order.save
        format.html { redirect_to @yummy_tummy_day_order, notice: 'Yummy tummy day order was successfully created.' }
        format.json { render json: @yummy_tummy_day_order, status: :created, location: @yummy_tummy_day_order }
      else
        format.html { render action: "new" }
        format.json { render json: @yummy_tummy_day_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yummy_tummy_day_orders/1
  # PUT /yummy_tummy_day_orders/1.json
  def update
    @yummy_tummy_day_order = YummyTummyDayOrder.find(params[:id])

    respond_to do |format|
      if @yummy_tummy_day_order.update_attributes(params[:yummy_tummy_day_order])
        format.html { redirect_to @yummy_tummy_day_order, notice: 'Yummy tummy day order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @yummy_tummy_day_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yummy_tummy_day_orders/1
  # DELETE /yummy_tummy_day_orders/1.json
  def destroy
    @yummy_tummy_day_order = YummyTummyDayOrder.find(params[:id])
    @yummy_tummy_day_order.destroy

    respond_to do |format|
      format.html { redirect_to yummy_tummy_day_orders_url }
      format.json { head :no_content }
    end
  end
end
