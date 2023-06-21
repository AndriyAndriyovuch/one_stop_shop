class Cart::RemoveProduct < BaseService
  attr_reader :session, :params

  def initialize(session, params = {})
    @session = session
    @params = params
  end

  def call
    session[:products].delete(params[:id])
  end
end
