require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  let!(:product) { create(:product, id: 13) }

  describe "routing" do
    it "routes to #index" do
      expect(get: "/products").to route_to("products#index")
    end

    it "routes to #new" do
      expect(get: "/products/new").to route_to("products#new")
    end

    it "routes to #show" do
      expect(get: "/products/13").to route_to("products#show", id: "13")
    end

    it "routes to #edit" do
      expect(get: "/products/13/edit").to route_to("products#edit", id: "13")
    end


    it "routes to #create" do
      expect(post: "/products").to route_to("products#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/products/13").to route_to("products#update", id: "13")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/products/13").to route_to("products#update", id: "13")
    end

    it "routes to #destroy" do
      expect(delete: "/products/13").to route_to("products#destroy", id: "13")
    end
  end
end