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
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:product) { build(:product) }

  it "is valid with valid attributes" do
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product2 = build(:product, name: '')
    expect(product2).to_not be_valid
  end

  it "is not valid without a description" do
    product2 = build(:product, description: '')
    expect(product2).to_not be_valid
  end

  it "is not valid without an price" do
    product2 = build(:product, price: '')
    expect(product2).to_not be_valid
  end

  it "is not valid without an balance" do
    product2 = build(:product, balance: '')
    expect(product2).to_not be_valid
  end

  it "is valid with zero balance" do
    product2 = build(:product, balance: 0)
    expect(product2).to be_valid
  end

  it "is valid with zero price" do
    product2 = build(:product, price: 0)
    expect(product2).to be_valid
  end

  it "is not valid with negative price" do
    product2 = build(:product, price: -1)
    expect(product2).to_not be_valid
  end

  it "is not valid with negative balance" do
    product2 = build(:product, balance: -1)
    expect(product2).to_not be_valid
  end
end
