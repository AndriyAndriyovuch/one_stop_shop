class Cart::ManagerService
  attr_reader :session, :params, :product
  attr_accessor :notice

  def initialize(session, params)
    @session = session
    @params = params
  end

  def call
    service = "Cart::#{params[:action_type].camelize}".constantize
    service.new(session, set_product).call
  end

  private

  def set_product
    @product = {
      id: params[:id],
      amount: params[:amount].to_i,
      balance: Product.find(params[:id]).balance
    }

    product[:amount] = 1 if product[:amount].blank? || product[:amount] <= 0
    product[:amount] = product[:balance] if product[:balance] < product[:amount]

    product
  end
end
