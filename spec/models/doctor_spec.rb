require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { FactoryGirl.create(:doctor)}

  describe "create valid doctor" do
    it "doctor should be valid" do
      doc = Doctor.create( name: "Ron", specialty: "Gp")
      expect(doc).to be_valid
    end
    it "name is required" do
      doc = Doctor.create( name: "", specialty: "Gp")
      expect(doc).not_to be_valid
    end
    it "name must be unique" do
       Doctor.create!( name: "Ron", specialty: "Gp")
       doc = Doctor.create( name: "Ron", specialty: "Gp")
      expect(doc).not_to be_valid
    end
    it "doctor name must be atleast 2 char long" do
      doc = Doctor.create( name: "Ro", specialty: "Gp")
      expect(doc).not_to be_valid
    end
    it "specialty is a mandatory field" do
      doc = Doctor.create( name: "Ro", specialty: "")
      expect(doc).not_to be_valid
    end
  end


end

# validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
# validates :specialty, presence: true