class OrdersController < ApplicationController
  def index
    @orders = collection
  end

  def show
    @order = resourse
  end

  def new
    @order = Order.new
  end

  def edit
    @order = resourse
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @order = resourse

    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order = resourse

    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

  def collection
    Order.all
  end

  def resourse
    Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :phone)
  end
end
