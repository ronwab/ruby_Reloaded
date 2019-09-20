require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user)}

  describe "should be valid" do
    it "name is required"  do
   user = User.create(name: " ", email: "ron@test.com")
      expect(user).not_to be_valid
    end
    it "email is required"  do
      user = User.create(name:"ron", email: "")
      expect(user).not_to be_valid
    end
    it "email must be unique" do
      user1 = User.create(name:'Ron', email:"ron@test.com")
      user2 =User.create(name:"pail", email:"ron@test.com")
      expect(user2).not_to be_valid
    end
    it "name should be more than 2 characters" do
      user =User.create(email:"ron@test.com", name: "r")
      expect(user).not_to be_valid
    end
    it "emails should be case insensitive" do
      user1 = User.create(name:'Ron', email:"ron@test.com")
      user2 =User.create(name:"pail", email:"RON@test.com")
      user3 =User.create(name:"pails", email:"RoN@tesT.com")
      expect(user1).to be_valid
      expect(user2).to be_valid
    end
  end
end


