# frozen_string_literal: true

class Appointment < ApplicationRecord
  validates_with AppointmentTimeValidator
  belongs_to :doctor
  belongs_to :patient

  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :starting_at, presence: true


end
