module Shopping
  def buy
    session[:products] = {} unless session[:products].present?
    session[:products] = Session.new(session, params).add_product

    redirect_to products_path, notice: "Product was added to cart."
  end

  def change_amount
    session[:products] = Session.new(session, params).set_new_amount

    redirect_to cart_path, notice: "Amount was changed"
  end

  def cancel_shipping
    session[:products] = Session.new(session).delete_product(params[:id])
    session.delete(:products) if session[:products].empty?

    redirect_to orders_path
  end

  def cart
    return unless session[:products]

    current_session = Session.new(session)
    @session_products = current_session.products
    @session_sum = current_session.sum
  end
end
