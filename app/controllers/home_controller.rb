class HomeController < ApplicationController
  def search
    results = Product.search(search_params[:q], search_params)

    products = results.map do |r|
      r.merge(r.delete('_source')).merge('id': r.delete('_id'))
    end

    @products = Product.where(id: products.map(&:id))

    render "products/index", status: :success
  end

  private

  def search_params
    params.permit(:q, :level)
  end
end
