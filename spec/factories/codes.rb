FactoryGirl.define do
  factory :code do
    text { Faker::Lorem.sentence }

    is_private false

    trait :text do
      text { Faker::Lorem.paragraph 100 }
    end

    trait :is_public do
      is_private true
    end
  end
end

