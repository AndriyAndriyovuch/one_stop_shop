class ApplicationController < ActionController::Base
  before_action :get_products_count

  private

  def get_products_count
    @products_count = Cart::StorageService.new(session).count_products
  end
end
