class DoctorSerializer < ActiveModel::Serializer
  has_many  :appointments
  attributes :id, :appointments
end
