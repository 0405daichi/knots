FactoryBot.define do
  factory :comment_donation do
    content {'test'}
    price {10000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
