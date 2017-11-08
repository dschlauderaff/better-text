FactoryBot.define do
  factory :textbook do
    title {Faker::Lorem.word}
    price {Faker::Number.between(100,1000)}
  end
end