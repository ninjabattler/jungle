require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations:' do
    describe "New User" do
      it "should save" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        expect(@user.save).to eq(true)
      end
      it "should have a unique email" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'}).save
        @user2 = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
        expect(@user2.save).to eq(false)
      end
      it "should have a matching password and confirmation" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'LOOL'})
        expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
        expect(@user.save).to eq(false)
      end
      it "should have an email" do
        @user = User.create({email: nil, first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
        expect(@user.save).to eq(false)
      end
      it "should have a first name" do
        @user = User.create({email: 'teeeee@gam.com', first_name: nil, last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
        expect(@user.save).to eq(false)
      end
      it "should have a last name" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: nil, password: 'MEME', password_confirmation: 'MEME'})
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
        expect(@user.save).to eq(false)
      end
      it "should have a password longer than 2 letters" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'qq', password_confirmation: 'qq'})
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 3 characters)")
        expect(@user.save).to eq(false)
      end
    end
    
    describe '.authenticate_with_credentials' do
      it "should ignore whitespace when logging in" do
        @user = User.create({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        @user.save
        expect(User.authenticate_with_credentials(' teeeee@gam.com ', @user.password)).not_to eq(nil)
      end
      it "should not be case sensitive" do
        @user = User.create({email: 'teeeee@gAm.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
        @user.save
        expect(User.authenticate_with_credentials('tEEeee@gam.com', @user.password)).not_to eq(nil)
      end
    end
  end
end
