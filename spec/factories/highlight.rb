FactoryGirl.define do
  factory :highlight do
    title Faker::Company.name
    video
    audio
    created_at
    sermon_link

  end
end
