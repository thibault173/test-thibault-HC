FactoryBot.define do
  factory :request do
    workstation { Workstation.create(name: "Workstation-test") }

    trait :unconfirmed do
      user
      status { "pending" }
    end

    trait :confirmed do
      association :user, :confirmed
      status { "pending" }
    end

    trait :accepted do
      association :user, :confirmed
      status { "accepted" }
      signature_date { Date.today }
    end
  end
end
