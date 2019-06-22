FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@sample.com" }
  end

  factory :singed_user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@sample.com" }
    password_digest { User.digest('password') }
  end
end
