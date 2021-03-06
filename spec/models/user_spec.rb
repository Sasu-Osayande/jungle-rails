require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is invalid when password length is less than 3" do
      password_length = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "45",
        password_confirmation: "45"
      )
      expect(password_length).to_not be_valid
    end
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
  describe '.authenticate_with_credentials' do
    it "is invalid when user authentication fails" do
      user = User.new(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )

      user = User.authenticate_with_credentials("osayande@email.com", user.password)
      expect(user).to be(nil)
    end
    it "is valid when a user adds spaces before and/or after their email" do
      user = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )

      auth_user = User.authenticate_with_credentials(" sasu@email.com ", user.password)
      expect(auth_user).to eq(user)
    end
    it "is valid when a user types their email in the wrong case" do
      user = User.create(
        first_name: "Sasu",
        last_name: "Osayande",
        email: "sasu@email.com",
        password: "456",
        password_confirmation: "456"
      )

      auth_user = User.authenticate_with_credentials("SASU@email.com", user.password)
      expect(auth_user).to eq(user)
    end
  end
end
