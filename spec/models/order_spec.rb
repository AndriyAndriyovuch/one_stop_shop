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
  let!(:order) { build(:order) }

  it "is valid with valid attributes" do
    expect(order).to be_valid
  end

  it "is not valid without a firstname" do
    order2 = build(:order, firstname: '')
    expect(order2).to_not be_valid
  end

  it "is not valid without a lastname" do
    order2 = build(:order, lastname: '')
    expect(order2).to_not be_valid
  end

  it "is not valid without an address" do
    order2 = build(:order, address: '')
    expect(order2).to_not be_valid
  end

  it "is not valid without an phone" do
    order2 = build(:order, phone: '')
    expect(order2).to_not be_valid
  end
end
