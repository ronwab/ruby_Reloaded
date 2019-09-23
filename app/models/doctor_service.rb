# frozen_string_literal: true

class DoctorService
  def self.call(params)
    new_doctor = Doctor.create!(params)
    Rails.logger.info("Just created a #{new_doctor.id}")
    new_doctor
  end
end
