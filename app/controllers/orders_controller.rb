class OrdersController < ApplicationController
  before_action :check_cart, only: [:new]
  before_action :set_cart, only: [:new, :create]

  def show
    @order = resourse
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      Orders::Manager.new(@order, session).call

      redirect_to order_path(@order), notice: "Order was successfully created."
    else
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

  def set_cart
    @cart = Cart::Storage.new(session, params)
  end

  def check_cart
    redirect_to root_path if session[:products].blank?
  end
end
