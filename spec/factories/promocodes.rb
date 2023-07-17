FactoryBot.define do
  factory :promocode do
    code { "MyString" }
    discount { "9.99" }
    discount_is_fixed { false }
  end
end
