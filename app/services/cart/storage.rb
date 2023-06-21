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
end
