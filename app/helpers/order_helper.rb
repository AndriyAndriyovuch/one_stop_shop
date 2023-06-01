module OrderHelper
  def select_sum(product)
    session[:products][product.id.to_s] * product.price
  end

  def total_sum
    session_products.map { |product| select_sum(product) }.sum
  end

  def table_title
    ["#", "Title", "Price", "Amount", "Sum", ""]
  end

  def session_products
    @session_products = session[:products].keys.map { |id| Product.find(id) }
  end
end
