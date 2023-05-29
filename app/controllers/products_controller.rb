class ProductsController < ApplicationController
  def index
    @products = collection
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

  private

  def collection
    Product.all
  end

  def resourse
    Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :balance)
  end
end