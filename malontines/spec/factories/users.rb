FactoryBot.define do
  factory :user, aliases: [:creator] do
    username { "g-hops" }
    password { "anotherSh1pInP0rt?" }
  end
end
