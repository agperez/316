
FactoryGirl.define do
  factory :highlight do
    title Faker::Company.name
    video Faker::Internet.url
    audio Faker::Internet.url
    created_at Date.today
    sermon_link Faker::Internet.url
  end
end
