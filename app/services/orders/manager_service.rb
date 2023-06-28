class Orders::ManagerService
  attr_reader :products_hash, :order, :session

  def initialize(order, session)
    @order = order
    @session = session
  end

  def call
    # create relations
    products_collection = Product.find(session[:products].keys)

    products = session[:products].map do |product_id, amount|
      balance = products_collection.find { product_id }.balance
      amount = [amount, balance].min

      { product_id:, amount: }
    end

    order.product_orders.insert_all(products)

    # substract balance
    order.products.each do |product|
      new_balance = product.balance - order.product_orders.find_by(product_id: product.id).amount
      product.update(balance: new_balance)
    end

    # clean cart
    session.delete(:products)
  end
end
