class Cart::Add < BaseService
  attr_reader :session, :product
  attr_accessor :notice

  def initialize(session, product)
    @session = session
    @product = product
  end

  def call
    if session[:products].key?(product[:id])
      session[:products][product[:id]] = available_amount
    else
      @session[:products].merge!(product[:id] => product[:amount])
    end
  end

  private

  def available_amount
    desired_amount = product[:amount] + session.dig(:products, product[:id])
    product[:balance] < desired_amount ? product[:balance] : desired_amount
  end
end
