class Cart::UpdateAmount
  attr_reader :session, :product, :product_balance
  attr_accessor :notice

  def initialize(session, product)
    @session = session
    @product = product
  end

  def call
    session[:products][product[:id]] = product[:amount]
  end
end
