class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name

  # has_many :doctors, through: :appointments
end
