FactoryBot.define do
  factory :user do
    username { "Aaron Summer" }
    sequence(:email)    { |n| "tester#{n}@example.com" }
    password {"dottlenouveaupaviliontightsfurze" }
  end
end
