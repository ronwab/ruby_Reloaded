# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "should be valid" do
    let(:user) { FactoryGirl.create(:user) }

    it "name is required" do
      user.name = " "

      expect(user).not_to be_valid
    end
    it "email is required" do
      user.email = " "
      expect(user).not_to be_valid
    end
    it "email must be unique" do
      user2 = user.dup
      expect(user2).not_to be_valid
    end
    # check why this fails
    it "name should be more than 4 characters" do
      user.name = "a" * 3
      expect(user).not_to be_valid
    end

    it "emails should saved as lowercase" do
      email = "RONALD.BUKENDA@TEST.COM"
      FactoryGirl.create(:user, email: email)
      expect(User.last.email).to eq(email.downcase)
    end
  end
end
