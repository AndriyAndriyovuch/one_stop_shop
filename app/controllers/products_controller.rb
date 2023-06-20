class ProductsController < ApplicationController
  def index
    @products = collection.ordered_by_name
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
