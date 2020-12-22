FactoryBot.define do
  factory :user do
    name { "test name" }
    sequence(:email)    { |n| "tester#{n}@example.com" }
    password {"dottlenouveaupaviliontightsfurze" }
  end
end
