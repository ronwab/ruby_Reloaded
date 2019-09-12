require 'rails_helper'

RSpec.describe Appointment, type: :model do

  let(:doctor) { FactoryGirl.create(:doctor) }
  let(:patient) { FactoryGirl.create(:patient) }
  let(:doctor2) { FactoryGirl.create(:doctor) }
  let(:patient2) { FactoryGirl.create(:patient) }

  describe "Patient should not be able to make overlapping appointments" do
    it "is valid with a clear schedule" do
      appointment = Appointment.new( doctor_id: doctor.id, patient_id: patient.id, starting_at: Time.now )
      expect(appointment).to be_valid
    end
    it "is invalid with schedule collusion " do
      time = Time.now
      Appointment.create!( doctor_id: doctor.id, patient_id: patient.id, starting_at: time )
      appointment = Appointment.new( doctor_id: doctor.id, patient_id: patient.id, starting_at: time )
      expect(appointment).not_to be_valid
    end
    it "is valid with different doctors and patients at the same time" do
      time = Time.now
      Appointment.create!( doctor_id: doctor.id, patient_id: patient.id, starting_at: time )
      appointment = Appointment.new( doctor_id: doctor2.id, patient_id: patient2.id, starting_at: time )
      expect(appointment).to be_valid
    end
  end
end