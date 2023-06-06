module OrderHelper
  def table_title
    ["#", "Title", "Price", "Amount", "Sum", ""]
  end

  def full_name(order)
    "#{order.first_name} #{order.last_name}"
  end

  def session_product_sum(product)
    session.dig(:products, product.id.to_s) * product.price
  end

  def order_product_sum(order, product)
    order.product_orders.find_by(product:).amount * product.price
  end

  def select_amount(order, product)
    order.product_orders.find_by(product:).amount
  end

  def order_total_sum(order)
    order.product_orders.map { |item| item.amount * Product.find(item.product_id).price }.sum
  end
end
