FactoryBot.define do
  factory :recipe do
    recipe_name {"オムライス"}
    main_food {"卵"}
    time {"10"}
    price {"1000"}
    recipe_how {"1.卵にしおこしょうとしょうゆを混ぜ合わせます"}
    material {"1.卵２個"}
    food { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/24942924_m.jpg')) }
  end
end
