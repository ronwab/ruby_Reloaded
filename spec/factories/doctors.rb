FactoryGirl.define do
  factory :doctor do
    name { Faker::Name.first_name }
    specialty { Faker::Job.title }

  end

end
