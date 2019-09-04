FactoryGirl.define do
  factory :doctor do
    name { Faker::Name.first_name }

  end

end
