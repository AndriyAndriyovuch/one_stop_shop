class Cart::Storage
  attr_reader :session, :params

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def products
    Product.find(session[:products].keys)
  end

  def sum
    products.map { |product| session[:products][product.id.to_s] * product.price }.sum
  end

  def count_products
    session[:products].present? ? session[:products].count : 0
  end
end
