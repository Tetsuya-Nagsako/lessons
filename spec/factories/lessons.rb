FactoryBot.define do
  factory :lesson do
    title { "test" }
    description { "test" }
    price { 200 }
    # image  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/logo.png')) }
    time_information { Time.current }
    user
  end
end