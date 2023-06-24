class Cart::AddProduct
  attr_reader :session, :product
  attr_accessor :notice

  def initialize(session, product)
    @session = session
    @product = product
  end

  def call
    if session[:products].key?(product[:id])
      new_amount = amount_greater_balance? ? product[:balance] : (product[:amount] + session.dig(:products, product[:id]))

      session[:products][product[:id]] = new_amount
    else
      @session[:products].merge!(product[:id] => product[:amount])
    end
  end

  private

  def amount_greater_balance?
    product[:balance] < (product[:amount] + session[:products][product[:id]])
  end
end
