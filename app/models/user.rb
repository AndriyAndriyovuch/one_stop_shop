class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, foreign_key: :customer_id

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true,
                       length: { within: 8..128 },
                       on: :create
end
