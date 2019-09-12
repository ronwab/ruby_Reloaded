class DoctorService
  def self.call(params)
    new_doctor = Doctor.create!(params)
    Rails.logger.info("Just created a #{new_doctor.id}")
    return new_doctor
  end
end
