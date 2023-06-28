class OrdersController < ApplicationController
  before_action :check_signed_in, only: %i[index]
  before_action :check_cart, only: [:new]
  before_action :set_cart, only: [:new, :create]

  def index
    @orders = current_user.orders
  end

  def show
    @order = resourse
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_user if user_signed_in?

    if @order.save
      Orders::ManagerService.new(@order, session).call

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

  def check_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  def set_cart
    @cart = Cart::Storage.new(session, params)
  end

  def check_cart
    redirect_to root_path if session[:products].blank?
  end
end
