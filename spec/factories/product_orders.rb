# table product_orders
#   product_id      bigint        null: false
#   order_id        bigint        null: false
#   amount          integer       null: false       default: 1
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :amount, numericality: { greater_than: 0 }

FactoryBot.define do
  factory :product_order do
    product
    order
    amount { 1 }
  end
end
