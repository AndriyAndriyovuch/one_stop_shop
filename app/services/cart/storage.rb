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
    Product
      .find(session[:products].keys)
      .sum { |product| product.price * session[:products][product.id.to_s] }
  end

  def count_products
    session[:products].present? ? session[:products].count : 0
  end
end
