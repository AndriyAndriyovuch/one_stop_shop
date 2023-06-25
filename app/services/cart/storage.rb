class Cart::Storage
  attr_reader :session, :params

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def realize_products
    Product.find(session[:products].keys)
  end

  def sum
    Product
      .find(session[:products].keys)
      .sum { |product| product.price * session[:products][product.id.to_s] }
  end

  def count_products
    return 0 if session[:products].blank?

    session[:products].count
  end
end
