class Cart::Update < BaseService
  attr_reader :session, :params, :product, :product_balance
  attr_accessor :notice

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def call
    case params[:update_action]

    when 'buy'
      add_product
      "Product was added to cart."

    when 'change'
      update_product
      "Amount was changed"

    when 'delete'
      delete_product
     "Product was removed"
    end
  end

  private

  def add_product
    set_product

    if session[:products].key?(product[:id])
      new_amount = amount_greater_balance? ? product_balance : product[:amount]

      session[:products][product[:id]] = new_amount
    else
      @session[:products].merge!(product[:id] => product[:amount])
    end
  end

  def update_product
    set_product

    session[:products][product[:id]] = product[:amount]
  end

  def delete_product
    session[:products].delete(params[:id])
    session.delete(:products) if session[:products].empty?
  end

  def set_product
    @product = {
      id: params[:id],
      amount: params[:amount].to_i
    }

    @product_balance = Product.find(product[:id]).balance

    product[:amount] = 1 if product[:amount].blank? || product[:amount] <= 0
    product[:amount] = product_balance if product_balance < product[:amount]
  end

  def amount_greater_balance?
    product_balance < (product[:amount] + session[:products][product[:id]])
  end
end