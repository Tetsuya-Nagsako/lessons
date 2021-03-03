FactoryBot.define do
  factory :lesson do
    title { "test" }
    description { "test" }
    price { 200 }
    image  { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/logo.png'), 'spec/fixtures/logo.png') }
    time_information { Time.current }
    user
  end
end