FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "111111" }
    password_confirmation { "111111" }
    introduction { "よろしく" }
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')) }
  end
end
