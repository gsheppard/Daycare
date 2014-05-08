require 'spec_helper'

feature 'user chooses display name' do

  # Acceptance Criteria
  # Display Name is required
  # Display must be unique

  let(:user) { FactoryGirl.build(:user) }

  before :each do
    @prev_count = User.count
  end

  scenario 'user signs up with valid display name' do
    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Display Name', with: user.display_name
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    click_on 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully. Welcome to Daycare.")
    expect(User.count).to eq(@prev_count + 1)
  end

  scenario 'user signs up with taken display name'
  scenario 'user signs up without display name'

end
