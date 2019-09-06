require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
  let!(:doctor) { FactoryGirl.create(:doctor) }

  describe "Get index" do
    it "Has a status of 200" do
      get  :index
      byebug
      expect(response.status).to eq(200)
      expect(response_json[:data]).to all(include(:name))
      expect(response_json[:data].first[:name]).to eq(doctor.name)
    end
  end

  describe "Get Show" do
    it "has a status of 200" do
      get :show, params: { id: doctor.id }
      expect(response.status).to eq(200)
      expect(response_json[:data][:name]).to eq(doctor.name)
    end
  end
  describe "Create a new doctor" do
    it "Creates a new doctor" do
      expect{ post :create, params: {doctor: { name: "Ron", specialty: "GP" }} }.to change { Doctor.count }.by(1)
    end
    it "Name cannot be blank" do
      post :create, params: { doctor: {name: " "}}

      expect(response_json[:message]).to include(" Name can't be blank,")
      # expect(response.status).to eq(403)
    end
  end
  describe "Deletes an existing Doctor" do
    it "Deletes the selected doctor" do
      delete :destroy, params:  {id: doctor.id}
      expect(response_json[:message]).to eq("Doctor deleted")
    end
  end
end
