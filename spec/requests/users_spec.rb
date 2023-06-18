# table users
#    email                     string              null: false
#    encrypted_password        string              null: false
#    first_name                string              null: false
#    last_name                 string              null: false
#    address                   string
#    phone                     string
#    reset_password_token      datetime
#    reset_password_sent_at    datetime
#    remember_created_at       datetime
#    created_at                datetime            null: false
#    updated_at                datetime            null: false
#
#    has_many :orders, foreign_key: :customer_id

#    validates :first_name, :last_name, presence: true
#    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
#    validates :password, :presence => true,
#                         :length => {:within => 8..128},
#                         :on => :create

require "rails_helper"

RSpec.describe "/users", type: :request do
  let!(:user) { create(:user, id: 13) }

  let(:new_attributes) { { user: attributes_for(:user) } }
  let(:valid_attributes) { { user: attributes_for(:user) } }
  let(:invalid_attributes) { { user: attributes_for(:user, :invalid_user) } }

  describe "GET /users/sign_in" do
    it "renders a successful response" do
      get new_user_session_path

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "POST /users/sign_in" do
    it "creates a new user session" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to have_http_status(303)
    end
  end

  describe "DELETE /users/sign_out" do
    it "destroys user session" do
      delete destroy_user_session_path

      expect(response).to have_http_status(303)
    end
  end

  describe "GET /users/sign_up" do
    it "renders a successful response" do
      get new_user_registration_path

      expect(response).to be_successful
      expect(response).to render_template(:new)
    end
  end

  describe "GET /users/edit" do
    it "renders a successful response" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get edit_user_registration_path(user)

      expect(response).to be_successful
      expect(response).to render_template(:edit)
    end
  end
end
