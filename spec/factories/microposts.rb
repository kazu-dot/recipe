FactoryBot.define do
  factory :micropost do
    title { "ヴィシソワーズ" }
    content{"Hello world "}
    association :user
  end
end
