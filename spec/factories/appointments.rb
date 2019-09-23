# frozen_string_literal: true

FactoryGirl.define do
  factory :appointment do
    doctor_id { Faker::Number.number(digits: 8) }
    patient_id { Faker::Number.number(digits: 8) }
    starting_at { Faker::Date.forward(days: 23) }
  end
end
