class Orders::CreateProductOrders
  def initialize(products_hash, order)
    @products_hash = products_hash
    @order = order
  end

  def call
    @products_hash.each { |product_id, amount| @order.product_orders.create(product_id:, amount:) }
  end
end
