class Cart::AddProduct < BaseService
  attr_reader :session, :params, :product, :product_balance

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def call
    set_product

    if session[:products].key?(product[:id])
      if amount_greater_balance?
        session[:products][product[:id]] = product_balance
      else
        session[:products][product[:id]] += product[:amount]
      end
    else
      @session[:products].merge!(product[:id] => product[:amount])
    end

    session[:products]
  end

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

  def amount_greater_balance?
    product_balance < (product[:amount] + session[:products][product[:id]])
  end
end
