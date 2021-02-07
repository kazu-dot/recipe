FactoryBot.define do
  factory :tag_map do
    association :micropost
    association :tag
  end
end
