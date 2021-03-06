require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    context 'given a user first name, last name, email and password that is not blank with matching password confirmation' do
      it 'is a valid user' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@testt.com", password: "password", password_confirmation: "password")
        expect(@user).to be_valid
      end
    end

    context 'given no user first name' do
      it 'is not a valid user' do
        @user = User.create(first_name: nil, last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end

    context 'given no user last name' do
      it 'is not a valid user' do
        @user = User.create(first_name: "Angel", last_name: nil, email: "angel@test.com", password: "password", password_confirmation: "password")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    context 'given no user email' do
      it 'is not a valid user' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: nil, password: "password", password_confirmation: "password")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end

    context 'given an email that already exists in the database, regardless of case' do
      it 'is not a valid user' do
        @user1 = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @user2 = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @user3 = User.create(first_name: "Angel", last_name: "Sin", email: "ANGEL@test.com", password: "password", password_confirmation: "password")
        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include("Email has already been taken")
        expect(@user3).to_not be_valid
        expect(@user3.errors.full_messages).to include("Email has already been taken")
      end
    end

    context 'given the password and password confirmation do not match' do
      it 'is not a valid user' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password1234")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context 'given a password with less than 6 characters in length' do
      it 'is not a valid user' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "pass", password_confirmation: "pass")
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end

  describe '.authenticate_with_credentials' do

    context 'given user provides incorrect login credentials (email or password)' do
      it 'will not log in successfully' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @user = User.authenticate_with_credentials('angel@test.com', 'password1234')
        expect(@user).to be(nil)
      end
    end

    context 'given user provides correct login credentials (email & password)' do
      it 'will log in successfully' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @current_user = User.authenticate_with_credentials('angel@test.com', 'password')
        expect(@current_user).to_not be(nil)
        expect(@current_user).to eql(@user)
      end
    end

    context 'given user provides email with trailing white spaces but has correct login credentials' do
      it 'will log in successfully' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @current_user = User.authenticate_with_credentials('   angel@test.com   ', 'password')
        expect(@current_user).to_not be(nil)
        expect(@current_user).to eql(@user)
      end
    end

    context 'given user provides email with CAPS but has correct login credentials' do
      it 'will log in successfully' do
        @user = User.create(first_name: "Angel", last_name: "Sin", email: "angel@test.com", password: "password", password_confirmation: "password")
        @current_user = User.authenticate_with_credentials('ANGEL@test.com', 'password')
        expect(@current_user).to_not be(nil)
        expect(@current_user).to eql(@user)
      end
    end

  end
end
