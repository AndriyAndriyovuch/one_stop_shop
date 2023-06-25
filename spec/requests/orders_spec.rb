# table orders
#   first_name      string        null: false
#   last_name       string        null: false
#   address         string        null: false
#   phone           string        null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :first_name, :last_name, :address, :phone, presence: true

#   has_many :product_orders, dependent: :destroy
#   has_many :products, through: :product_orders

require 'rails_helper'

RSpec.describe 'OrdersController', type: :request do
  let!(:order) { create(:order) }
  let!(:product) { create(:product) }

  describe 'GET #show' do
    it 'returns the order' do
      get order_path(order)

      expect(response).to have_http_status(:success)
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'GET #new' do
    it 'sets products and initializes a new order' do
      post add_product_in_cart_path(product)
      get new_order_path

      expect(response).to have_http_status(:success)

      expect(assigns(:order)).to be_a_new(Order)
      expect(assigns(:session_products)).not_to be_nil
      expect(assigns(:session_sum)).not_to be_nil
    end
  end

  describe 'POST #create' do
    context 'with valid order params' do
      it 'creates a new order, calls Orders::ManagerService, and redirects to order page' do
        post add_product_in_cart_path(product)
        order_params = attributes_for(:order)

        expect(post orders_path, params: { order: order_params }).to change(Order, :count).by(1)

        expect(response).to redirect_to(order_path(Order.last))
        expect(flash[:notice]).to eq('Order was successfully created.')

        expect(session[:products]).to be_nil # Cart should be cleaned
      end
    end

    context 'with invalid order params' do
      it 'renders the new template with unprocessable entity status' do
        post add_product_in_cart_path(product)
        order_params = attributes_for(:order, first_name: '')

        post orders_path, params: { order: order_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)

        expect(assigns(:session_products)).not_to be_nil
        expect(assigns(:session_sum)).not_to be_nil
      end
    end
  end
end
