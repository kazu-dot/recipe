FactoryBot.define do
  factory :micropost do
    title { "test title" }
    sequence(:content) {"Hello world #{n} "}
    association :user
  end
end
