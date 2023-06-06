class Products::Session
  def initialize(products_hash)
    @products_hash = products_hash
  end

  def products
    @products_hash.keys.map { |id| Product.find(id) }
  end

  def sum
    products.map { |product| @products_hash[product.id.to_s] * product.price }.sum
  end
end
