FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password              { "111111" }
    password_confirmation { "111111" }
    confirmed_at { Date.today }
  end
end
