FactoryBot.define do
  factory :quote do
    name do
      Faker::Lorem.word
    end
  end
end
