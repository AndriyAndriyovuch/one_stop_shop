module OrderHelper
  def session_product_sum(product)
    session.dig(:products, product.id.to_s) * product.price
  end
end
