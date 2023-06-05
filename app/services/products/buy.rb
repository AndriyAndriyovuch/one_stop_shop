class Products::Buy
  def initialize(params:)
    @params = params
  end

  def call
    product = Product.find(@params[:product_id])

    @params[:amount] = product.balance if product.balance < @params[:amount].to_i
    @params[:amount] = 1 if @params[:amount].blank?

    {@params[:product_id] => @params[:amount].to_i}
  end
end
