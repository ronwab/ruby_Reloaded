require 'rails_helper'

RSpec.describe Api::V1::DoctorsController, type: :controller do
  let!(:doctor) { FactoryGirl.create(:doctor, name: "test") }
  describe "Get index" do
    it "Has a status of 200" do
      get  :index
      expect(response.status).to eq(200)
      expect(response_json[:data]).to all(include(:name))
      expect(response_json[:data].first[:name]).to eq(doctor.name)
    end
  end


end
