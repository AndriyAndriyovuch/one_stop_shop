module OrderHelper
  def table_title
    ["#", "Title", "Price", "Amount", "Sum", ""]
  end

  def select_session_sum(product)
    format_decimal(session[:products][product.id.to_s] * product.price)
  end

  def select_order_sum(order, product)
    format_decimal(order.product_orders.find_by(product_id: product.id).amount * product.price)
  end

  def select_amount(order, product)
    order.product_orders.find_by(product_id: product.id).amount
  end

  def session_total_sum
    format_decimal(session_products.map { |product| select_session_sum(product).to_f }.sum)
  end

  def order_total_sum(order)
    format_decimal(order.product_orders.map {|item| item.amount * Product.find(item.product_id).price}.sum)
  end

  def session_products
    @session_products = session[:products].keys.map { |id| Product.find(id) }
  end

  def full_name(order)
    "#{order.first_name} #{order.last_name}"
  end
end
