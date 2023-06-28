class Order < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  belongs_to :customer, class_name: 'User', foreign_key: :customer_id

  validates :first_name, :last_name, :address, :phone, presence: true

  def product_sum(product)
    ProductOrder.joins(:product)
                .where(order_id: id, products: { id: product.id })
                .sum('product_orders.amount * products.price')
  end

  def product_amount(product)
    product_orders.find_by(product:).amount
  end

  def total_sum
    ProductOrder.joins(:product)
                .where(order_id: id)
                .sum('product_orders.amount * products.price')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
