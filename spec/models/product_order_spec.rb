# table product_orders
#   product_id      bigint        null: false
#   order_id        bigint        null: false
#   amount          integer       null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :amount, numericality: { greater_than: 0 }

require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  let!(:order) { build(:order, id: 666) }
  let!(:product) { build(:product, id: 13) }

  let!(:product_order) { build(:product_order, product:, order: ) }

  it "is valid with valid attributes" do
    expect(product_order).to be_valid
  end

  it "is valid with current product" do
    expect(product_order.product.id).to eq(13)
  end

  it "is valid with current order" do
    expect(product_order.order.id).to eq(666)
  end

  it "is not valid with different product" do
    expect(product_order.product.id).to_not eq(1)
  end

  it "is not valid with different order" do
    expect(product_order.order.id).to_not eq(1)
  end

  it "is valid with amount greater than 0" do
    order2 = build(:product_order, amount: 3, product:, order: )
    expect(order2).to be_valid
  end

  it "is not valid with 0 amount" do
    order2 = build(:product_order, amount: 0, product:, order: )
    expect(order2).to_not be_valid
  end
end
