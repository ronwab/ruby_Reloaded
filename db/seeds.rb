# frozen_string_literal: true

5.times do
  Article.create(
    title: Faker::Book.title,
    body: Faker::Lorem.sentence
  )
end

5.times do
  Doctor.create(
    name: Faker::Artist.name
  )
end
5.times do
  Patient.create(
    name: Faker::Artist.name
  )
end
