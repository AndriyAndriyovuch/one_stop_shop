# # spec/requests/cart_spec.rb
# require 'rails_helper'

# RSpec.describe "Cart", type: :request do
#   include RSpec::Rails::RequestExampleGroup


#   describe "GET /cart" do
#     it "renders the cart page" do
#       get cart_path
#       expect(response).to have_http_status(200)
#     end
#   end

#   describe "POST /products/:id/buy" do
#     let(:product) { create(:product) }

#     it "adds the product to the cart" do
#       post buy_product_path(product)

#       expect(session[:products][product.id.to_s]).to be_present
#     end

#     it "redirects back to the previous page" do
#       post buy_product_path(product)
#       expect(response).to redirect_to(request.referrer || root_path)
#     end
#   end

#   describe "POST /products/:id/change_amount" do
#     let(:product) { create(:product) }
#     let(:amount) { 5 }

#     it "updates the product amount in the cart" do
#       post change_amount_product_path(product), params: { amount: amount }
#       expect(session[:products][product.id.to_s]).to eq(amount)
#     end

#     it "redirects back to the previous page" do
#       post change_amount_product_path(product), params: { amount: amount }
#       expect(response).to redirect_to(request.referrer || root_path)
#     end
#   end

#   describe "POST /products/:id/cancel_shipping" do
#     let(:product) { create(:product) }

#     it "removes the product from the cart" do
#       post cancel_shipping_product_path(product)
#       expect(session[:products][product.id.to_s]).to be_nil
#     end

#     it "redirects back to the previous page" do
#       post cancel_shipping_product_path(product)
#       expect(response).to redirect_to(request.referrer || root_path)
#     end
#   end

#   describe "DELETE /clean_cart" do
#     it "clears the cart" do
#       delete clean_cart_path
#       expect(session[:products]).to be_empty
#     end

#     it "redirects to the products page" do
#       delete clean_cart_path
#       expect(response).to redirect_to(products_path)
#     end
#   end
# end
