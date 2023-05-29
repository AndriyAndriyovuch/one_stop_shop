require "rails_helper"

RSpec.describe ProductsController, type: :routing do
<<<<<<< HEAD
  let!(:product) { create(:product, id: 13) }

=======
>>>>>>> add product and order controllers, views, routes, request and routing tests
  describe "routing" do
    it "routes to #index" do
      expect(get: "/products").to route_to("products#index")
    end

    it "routes to #new" do
      expect(get: "/products/new").to route_to("products#new")
    end

    it "routes to #show" do
<<<<<<< HEAD
      expect(get: "/products/13").to route_to("products#show", id: "13")
    end

    it "routes to #edit" do
      expect(get: "/products/13/edit").to route_to("products#edit", id: "13")
=======
      expect(get: "/products/1").to route_to("products#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/products/1/edit").to route_to("products#edit", id: "1")
>>>>>>> add product and order controllers, views, routes, request and routing tests
    end


    it "routes to #create" do
      expect(post: "/products").to route_to("products#create")
    end

    it "routes to #update via PUT" do
<<<<<<< HEAD
      expect(put: "/products/13").to route_to("products#update", id: "13")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/products/13").to route_to("products#update", id: "13")
    end

    it "routes to #destroy" do
      expect(delete: "/products/13").to route_to("products#destroy", id: "13")
=======
      expect(put: "/products/1").to route_to("products#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/products/1").to route_to("products#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/products/1").to route_to("products#destroy", id: "1")
>>>>>>> add product and order controllers, views, routes, request and routing tests
    end
  end
end
