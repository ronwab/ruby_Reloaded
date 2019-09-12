# frozen_string_literal: true
class Appointment < ApplicationRecord

  # before_create :check_available
validates_with AppointmentTimeValidator
  belongs_to :doctor
  belongs_to :patient

end


