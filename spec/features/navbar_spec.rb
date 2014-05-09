require 'spec_helper'

feature 'navbar' do

  # Logo directs to /daycare
  # If not signed in, 'Sign In' and 'Sign Up' are visible
  # - and point to the correct paths
  # If signed in, display name is visible with dropdown to
  # - edit and sign out links.

  context 'not signed in' do
    scenario 'presence of links' do
      visit root_path

      expect(page).to have_content('Daycare')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    scenario 'functionality of links' do
      visit root_path

      click_on 'Sign In'
      expect(current_path).to eq(new_user_session_path)

      click_on 'Sign Up'
      expect(current_path).to eq(new_user_registration_path)
    end
  end

  context 'signed in' do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      sign_in_as(user)
      visit root_path
    end

    scenario 'presence of links' do
      expect(page).to have_content(user.display_name)
      expect(page).to have_link('Daycare')
      expect(page).to have_link('Edit')
      expect(page).to have_link('Sign Out')
    end

    scenario 'functionality of links' do
      click_on 'Daycare'
      expect(current_path).to eq(daycare_pokemons_path)

      click_on 'Edit'
      expect(current_path).to eq(edit_user_registration_path)

      click_on 'Sign Out'
      expect(current_path).to eq(root_path)
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end
end
