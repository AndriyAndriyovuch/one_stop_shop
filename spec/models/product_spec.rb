# table products
#   name            string        null: false
#   description     text          null: false
#   price           decimal       null: false      precision: 8, scale: 2
#   balance         integer       null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :name, :description, presence: true
#   validates :price, :balance, numericality: { greater_than_or_equal_to: 0 }

require 'rails_helper'

RSpec.describe Product, type: :model do
  it {
    is_expected.to validate_presence_of(:name)
  }
  it {
    is_expected.to validate_presence_of(:description)
  }
  it {
    is_expected.to validate_numericality_of(:price)
  }
  it {
    is_expected.to validate_numericality_of(:balance)
  }

  it {
    is_expected.to validate_numericality_of(:price).
      is_greater_than_or_equal_to(0)
  }
  it {
    is_expected.to validate_numericality_of(:balance).
      is_greater_than_or_equal_to(0)
  }

  it {
    is_expected.to have_many(:orders)
  }
  it {
    is_expected.to have_many(:product_orders)
  }
end
