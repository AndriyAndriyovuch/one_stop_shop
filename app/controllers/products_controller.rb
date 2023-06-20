class ProductsController < ApplicationController
  def index
    @products = collection.order(:name)
  end

  def show
    @product = resourse
  end

  private

  def collection
    Product.all
  end

  def resourse
    collection.find(params[:id])
  end
end
