class AppointmentTimeValidator < ActiveModel::Validator
  def validate(record)
    existing = record.class.where(doctor_id:record.doctor_id, patient_id:record.patient_id, starting_at: record.starting_at).where.not(id: record.id)
    record.errors[:appointment] << "There is already an appointment scheduled at time time" if existing.present?
  end
end
