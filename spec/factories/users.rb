FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password { "azerty" }
    sequence(:name) { |n| "N°#{n}" }
    phone_number { "06" }
    biography { "Je pense donc je suis." }

    after(:build) { |u| u.skip_confirmation_notification! }

    trait :confirmed do
      after(:create) { |u| u.confirm }
    end
  end
end
