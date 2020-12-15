FactoryBot.define do
  factory :micropost do
    sequence(:content) {"Hello world #{n} "}
    association :user
  end
end
