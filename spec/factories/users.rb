FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "111111" }
    password_confirmation {"111111"}
    introduction {"よろしく"}
  end
end
