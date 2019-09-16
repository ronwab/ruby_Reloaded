# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :specialty, presence: true
end
