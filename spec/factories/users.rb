FactoryBot.define do
  factory :user do
    name {'鈴木'}
    email {'test@example'}
    password {'1234test'}
    password_confirmation {password}
  end
end
