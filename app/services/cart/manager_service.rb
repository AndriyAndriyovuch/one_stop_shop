class Cart::ManagerService
  attr_reader :session, :params
  attr_accessor :notice

  def initialize(session, params)
    @session = session
    @params = params
  end

  def call
    service = "Cart::#{params[:action_type].to_s.camelize}".constantize
    product = get_product

    service.call(session, product)
  end

  private

  def get_product
    balance = Product.find(params[:id]).balance

    # set value if form send invalid data
    params[:amount] = 1 if params[:amount].blank?

    # set product if amount greater than balance
    params[:amount] = balance if balance < params[:amount].to_i

    product = {
      id: params[:id],
      amount: params[:amount].to_i,
      balance: balance
    }
  end
end
