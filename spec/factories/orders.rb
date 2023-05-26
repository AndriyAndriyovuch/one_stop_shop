# table orders
#   first_name      string        null: false
#   last_name       string        null: false
#   address         string        null: false
#   phone           string        null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :first_name, :last_name, :address, :phone, presence: true

FactoryBot.define do
  factory :order do
    id { 13 }
    first_name { "Luke" }
    last_name { "Skywalker" }
    address { "Tatooine" }
    phone { "326-3827" }
  end
end
