# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true
end
