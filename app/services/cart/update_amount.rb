class Cart::UpdateAmount < BaseService
  attr_reader :session, :params, :product, :product_balance

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def call
    set_product

    session[:products][product[:id]] = product[:amount]
    session[:products]
  end

  private

  def set_product
    @product = {
      id: params[:id],
      amount: params[:amount].to_i
    }

    @product_balance = Product.find(product[:id]).balance

    product[:amount] = 1 if product[:amount].blank? || product[:amount] <= 0
    product[:amount] = product_balance if product_balance < product[:amount]
  end

end
