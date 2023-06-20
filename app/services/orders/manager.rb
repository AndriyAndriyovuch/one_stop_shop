class Orders::Manager
  attr_reader :products_hash, :order, :current_session

  def initialize(products_hash, order, current_session)
    @products_hash = products_hash
    @order = order
    @current_session = current_session
  end

  def call
    create_relations
    substract_balance
    clean_cart
  end

  private

  def create_relations
    products_hash.each do |product_id, amount|
      product = Product.find(product_id)
      amount = [amount, product.balance].min

      order.product_orders.create(product_id:, amount:)
    end
  end

  def substract_balance
    order.products.each do |product|
      new_balance = product.balance - order.product_orders.find_by(product_id: product.id).amount
      product.update(balance: new_balance)
    end
  end

  def clean_cart
    current_session.delete(:products)
  end 
end
