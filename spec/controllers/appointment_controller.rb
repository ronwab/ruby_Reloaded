require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :controller do
  let(:appointment) { FactoryGirl.create(:appointment) }
  let(:doctor) { FactoryGirl.create(:doctor) }
  let(:patient) { FactoryGirl.create(:patient) }

  describe "Patient is able to schedule appointments" do
    it "Patient should be able to schedule an appointment " do
      expect {post :create, params: { doctor_id: doctor.id , patient_id: patient.id, appointment: "2019-09-11 06:37:20 " }}.to change { Appointment.count }.by(1)

      expect(response.status).to eq(200)
    end
    it "Patient should not be able to schedule multiple appointments per day" do

    end
    it "Two appointments should not be booked at the same time" do
    end
    it "invalid patients should not be able to schedule appointments" do
    end
    it "patients should only schedule appointments with valid doctors" do
    end
  end

  describe "Show all appointments for doctors" do
    it "View all doctor appointments based on doctor specialty" do
    end
    it "View Appointments for a specific doctor" do
    end
  end

  describe "delete appointments" do
    it "Delete appointments for a specific doctor" do
    end
    it "Delete appointments for all doctors" do
    end
  end
end
