class Order < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  validates :first_name, :last_name, :address, :phone, presence: true

  def product_sum(product)
    ActiveRecord::Base.connection.execute("SELECT item.amount * p.price AS product_sum
                                            FROM product_orders AS item
                                            JOIN products AS p ON item.product_id = p.id
                                            WHERE item.order_id = #{id} AND p.id = #{product.id};")[0]['product_sum']
  end

  def product_amount(product)
    product_orders.find_by(product:).amount
  end

  def total_sum
    ActiveRecord::Base.connection.execute("SELECT SUM(item.amount * p.price) as total_sum
                                            FROM product_orders AS item
                                            JOIN products AS p ON item.product_id = p.id
                                            WHERE item.order_id = #{id} ;")[0]['total_sum']
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
