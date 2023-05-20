# table orders
#   firstname       string        null: false
#   lastname        string        null: false
#   address         string        null: false
#   phone           string        null: false
#   created at      datetime      null: false
#   updated at      datetime      null: false

#   validates :firstname, :lastname, :address, :phone, presence: true

FactoryBot.define do
  factory :order do
    id { 13 }
    firstname { "Luke" }
    lastname { "Skywalker" }
    address { "Tatooine" }
    phone { "326-3827" }
  end
end
