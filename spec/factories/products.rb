# table products
#   name            string        null: false
#   description     text          null: false
#   price           decimal       null: false      precision: 8, scale: 2
#   balance         integer       null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :name, :description, presence: true
#   validates :price, :balance, numericality: { greater_than_or_equal_to: 0 }

require 'faker'

FactoryBot.define do
  factory :product do
    name { Faker::Game.title }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    price { rand(15.0..99.0) }
    balance { rand(20..60) }
  end
end
