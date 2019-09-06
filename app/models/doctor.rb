class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, :through=> :appointments
  validates :name, presence: true, length: {minimum: 2} , uniqueness: true
  validates :specialty, presence: true
end
