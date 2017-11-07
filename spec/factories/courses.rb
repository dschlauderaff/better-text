FactoryBot.define do
  factory :course do
    name {Faker::Lorem.word}
    enrollment {Faker::Number.between(100,1000)}
  end
end