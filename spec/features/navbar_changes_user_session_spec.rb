require 'rails_helper'

describe 'Navbar changes for user session' do
  describe 'No user signed in' do
    before do
      visit 'welcome/index'
    end

    it 'displays link to new_user_registration' do
      within("ul.navbar-right") do
        expect( page ).to have_content "Sign Up"
      end
    end

    it 'displays link to new_user_session' do
      within("ul.navbar-right") do
        expect( page ).to have_content "Sign In"
      end
    end
  end

  describe 'Signed in user' do

    before do
      @user = create(:user) # Confirmed user
    end

    it 'displays user first_name in navbar' do
     sign_in_user
      within("ul.navbar-right") do
        expect( page ).to have_content @user.first_name
      end
    end

    it 'displays #user_options dropdown' do
      sign_in_user
      within("li.dropdown") do
        expect( page ).to have_content "User Options"
      end
    end

    it 'displays link to edit_user_options' do
      sign_in_user
      within("ul.dropdown-menu") do
        expect( page ).to have_content "Edit User Info"
      end
    end

    it 'displays link to destroy_user_session_path' do
      sign_in_user
      within("ul.dropdown-menu") do
        expect( page ).to have_content "Sign Out"
      end
    end
  end
end

def sign_in_user
  visit 'users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end