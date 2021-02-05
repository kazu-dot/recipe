FactoryBot.define do
  factory :comment do
    content "いいですね!"
    association :micropost
    association :user
  end
end
