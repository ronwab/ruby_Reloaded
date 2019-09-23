# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::PatientsController, type: :controller do
  let!(:patient) { FactoryGirl.create(:patient) }

  describe "Get the index page" do
    it "should display a list of all patients" do
      get :index
      expect(response.status).to eq(200)
      expect(response_json[:data].first[:first_name]).to eq(patient.first_name)
    end
  end

  describe "Show patient based on id" do
    it "should return a patient with a given id" do
      get :show, params: { id: patient.id }
      expect(response.status).to eq(200)
      expect(response_json[:data][:first_name]).to eq(patient.first_name)
    end
  end
  describe "Create a new patient" do
    it "creates a new patient" do
      expect { post :create, params: { first_name: "Ron", last_name: "wab", date_of_birth: " 2019-09-09 06:38:01 -0400", phone_number: 123_323_213 } }.to change { Patient.count }.by(1)
    end
  end
end
