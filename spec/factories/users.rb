FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.unique.email }
    password              { 'password123' }
    password_confirmation { 'password123' }
    created_at            { Time.current }
    confirmed_at          { Time.current }

    trait :unconfirmed_no_email do
      confirmed_at { nil }
      after(:build) { |user| user.skip_confirmation_notification! }
    end
  end
end
