FactoryBot.define do
  factory :micropost do
    title { "ヴィシソワーズ" }
    content{"ジャガイモをミキサーにかけて牛乳を加えて温める"}
    association :user
  end
end
