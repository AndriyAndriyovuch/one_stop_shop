class OrdersController < ApplicationController
  def show
    @order = resourse
  end

  def new
    redirect_to products_path unless session[:products].present?

    set_products
    @order = Order.new
  end

  def edit
    @order = resourse
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      Orders::Manager.new(session[:products], @order, session).call

      redirect_to order_path(@order), notice: "Order was successfully created."
    else
      set_products
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
    collection.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :phone)
  end

  def set_products
    cart = Cart::Storage.new(session, params)

    @session_products = cart.products
    @session_sum = cart.sum
  end
end
