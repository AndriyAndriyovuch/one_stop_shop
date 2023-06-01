class ProductsController < ApplicationController
  def index
    @products = collection.order(:name)
  end

  def show
    @product = resourse
  end

  def new
    @product = Product.new
  end

  def edit
    @product = resourse
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = resourse

    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = resourse

    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def buy
    session[:products] = {} unless session[:products]
    params[:amount] = 1 if params[:amount].blank?

    if session[:products].has_key?(params[:product_id])
      session[:products][params[:product_id]] += params[:amount].to_i
    else
      session[:products][params[:product_id]] = params[:amount].to_i
    end

    check_balance

    redirect_to products_path
  end

  def cancel_shipping
    session[:products].delete(params[:id])

    redirect_to orders_path
  end

  private

  def collection
    Product.all
  end

  def resourse
    collection.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :balance)
  end

  def check_balance
    product = Product.find(params[:product_id])

    session[:products][params[:product_id]] =
      product.balance if product.balance < session[:products][params[:product_id]]
  end
end
