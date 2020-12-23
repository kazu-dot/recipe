FactoryBot.define do
  factory :micropost do
    title { "test title" }
    content{"Hello world "}
    association :user
  end
end
