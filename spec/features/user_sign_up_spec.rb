require 'rails_helper'

describe 'User sign up' do

  describe "successful sign-up" do

    it "sends confirmation email" do
      sign_up_nav
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect( page ).to have_content 'A message with a confirmation link has been sent'
    end
  end

  describe "unsuccessful sign-up" do

    it "requires valid email" do
      sign_up_nav
      fill_in 'Email', with: 'user@exc' 
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'passowrd'
      click_button 'Sign up'
      expect( page ).to have_content 'Email is invalid'
    end

    it "requires valid password" do
      sign_up_nav
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'pass'
      fill_in 'Password confirmation', with: 'pass'
      click_button 'Sign up'
      expect( page ).to have_content 'Password is too short'
    end

    it "requires matching passwords" do
      sign_up_nav
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'pass'
      click_button 'Sign up'
      expect( page ).to have_content "Password confirmation doesn't match Password"
    end
  end
end

def sign_up_nav
  visit 'users/sign_up'
end
