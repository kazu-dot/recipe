FactoryBot.define do
  factory :comment do
    content "MyString"
    association :user
    association :micropost
  end
end
