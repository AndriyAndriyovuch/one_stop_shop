# table orders
#   firstname       string        null: false
#   lastname        string        null: false
#   address         string        null: false
#   phone           string        null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :firstname, :lastname, :address, :phone, presence: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it {
    is_expected.to validate_presence_of(:firstname)
  }
  it {
    is_expected.to validate_presence_of(:lastname)
  }
  it {
    is_expected.to validate_presence_of(:address)
  }
  it {
    is_expected.to validate_presence_of(:phone)
  }
  it {
    is_expected.to have_many(:products)
  }
  it {
    is_expected.to have_many(:product_orders)
  }
end
