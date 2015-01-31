FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    email Faker::Internet.email
    password Faker::Internet.password
    last_name Faker::Name.last_name
    gender ['male','female'].sample
    birth_date Faker::Date.backward
    spouse Faker::Name.name
    address1 Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip.to_i

    trait :gets_reminders do
      reminders true
    end

    trait :admin do
      admin true
    end

    trait :deactivated do
      deactivated true
    end

    trait :hides_email do
      hide_email true
    end

    trait :hides_phone do
      hide_phone true
    end

    trait :hides_address do
      hide_address true
    end
    
  end


end
