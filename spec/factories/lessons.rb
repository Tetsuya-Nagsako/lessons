FactoryBot.define do
  factory :lesson do
    title { "test" }
    description { "test" }
    price { 200 }
    time_information { Time.current }
    user
  end
end