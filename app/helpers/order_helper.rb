module OrderHelper
  def session_product_sum(product)
    session.dig(:products, product.id.to_s) * product.price
  end

  def count_products
    session[:products].present? ? session[:products].count : 0
  end
end
