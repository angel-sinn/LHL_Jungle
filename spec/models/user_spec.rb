require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    context 'given a user first name, last name, email and password that is not blank with matching password confirmation' do
      it 'is a valid user' do
        @user = User.new(name: "Angel", email: "angel@test.com", password: "password", password_confirmation: "password")
        expect(@user).to be_valid
      end
    end

    context 'given the password and password confirmation do not match' do
      it 'is not a valid user' do
        @user = User.new(name: "Angel", email: "angel@test.com", password: "password", password_confirmation: "password1234")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

  end
end
