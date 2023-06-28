class Cart::UpdateAmount < BaseService
  attr_reader :session, :product

  def initialize(session, product)
    @session = session
    @product = product
  end

  def call
    session[:products][product[:id]] = product[:amount]
  end
<<<<<<< HEAD

  private

  def set_product
    @product = {
      id: params[:id],
      amount: params[:amount].to_i
    }

    @product_balance = Product.find(product[:id].to_i).balance

    product[:amount] = 1 if product[:amount].blank? || product[:amount] <= 0
    product[:amount] = product_balance if product_balance < product[:amount]
  end
=======
>>>>>>> add/controllers_views
end
