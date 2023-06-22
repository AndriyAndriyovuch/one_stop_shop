class Orders::Manager
  attr_reader :products_hash, :order, :session

  def initialize(products_hash, order, session)
    @products_hash = products_hash
    @order = order
    @session = session
  end

  def call
    # create relations
    products_hash.each do |product_id, amount|
      order.product_orders.create(product_id:, amount: [amount, Product.find(product_id).balance].min)
    end

    # substract balance
    order.products.each do |product|
      new_balance = product.balance - order.product_orders.find_by(product_id: product.id).amount
      product.update(balance: new_balance)
    end

    # clean cart
    session.delete(:products)
  end
end
