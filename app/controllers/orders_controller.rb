class OrdersController < ApplicationController
  before_action :check_cart, only: [:new]

  def show
    @order = resourse
  end

  def new
    set_products

    @order = Order.new
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

  private

  def resourse
    Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :phone)
  end

  def set_products
    cart = Cart::Storage.new(session, params)

    @session_products = cart.realize_products
    @session_sum = cart.sum
  end

  def check_cart
    redirect_to root_path if session[:products].blank?
  end
end
