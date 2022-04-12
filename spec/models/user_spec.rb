require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is invalid when password and password confirmation do not match" do
      password_match = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "123"
      )
      expect(password_match).to_not be_valid
    end
    it "is invalid without password" do
      no_password = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: nil,
        password_confirmation: "456"
      )
      expect(no_password).to_not be_valid
    end
    it "is invalid without password confirmation" do
      no_password_conf = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: nil
      )
      expect(no_password_conf).to_not be_valid
    end
    it "is invalid when email is not unique" do
      unique_email = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )
      not_unique_email = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "SASU@email.com",
        password: "456",
        password_confirmation: "456"
      )
      expect(not_unique_email).to_not be_valid
    end
    it "is invalid without email" do
      no_email = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: nil,
        password: "456",
        password_confirmation: "456"
      )
      expect(no_email).to_not be_valid
    end
    it "is invalid without first name" do
      no_first_name = User.create(
        first_name: nil,
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )
      expect(no_first_name).to_not be_valid
    end
    it "is invalid without last name" do
      no_last_name = User.create(
        first_name: "Sasu",
        last_name: nil,
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )
      expect(no_last_name).to_not be_valid
    end
  end
end
