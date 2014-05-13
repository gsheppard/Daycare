require 'spec_helper'

feature 'user chooses display name' do

  # Acceptance Criteria
  # Display name:
  # - is required
  # - must be unique
  # - must be under 25 characters
  # - must be more than 5 characters
  # - must not have anything other than /a-zA-Z0-9_-/

  let(:user) { FactoryGirl.build(:user) }
  let(:sign_up) { within(:css, '.form-actions') { click_on 'Sign Up' } }

  before :each do
    @prev_count = User.count
    visit new_user_registration_path
  end

  scenario 'user signs up with valid display name' do
    fill_in 'Email', with: user.email
    fill_in 'Display Name', with: user.display_name
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("Welcome! You have signed up successfully. Welcome to Daycare.")
    expect(User.count).to eq(@prev_count + 1)
  end

  scenario 'user signs up with taken display name' do
    user.save

    fill_in 'Email', with: 'example@email.com'
    fill_in 'Display Name', with: user.display_name
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("has already been taken")
    expect(User.count).to eq(@prev_count + 1)
  end

  scenario 'user signs up without display name' do
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("can't be blank")
    expect(User.count).to eq(@prev_count)
  end

  scenario 'user signs up with too long of a display name' do
    fill_in 'Email', with: user.email
    fill_in 'Display Name', with: "too_long_of_a_display_name"
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("is too long")
    expect(User.count).to eq(@prev_count)
  end

  scenario 'user signs up for too short of a display name' do
    fill_in 'Email', with: user.email
    fill_in 'Display Name', with: "shrt"
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("too short")
    expect(User.count).to eq(@prev_count)
  end

  scenario 'user signs up for invalid format of display name' do
    fill_in 'Email', with: user.email
    fill_in 'Display Name', with: "valid_$_length"
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password

    sign_up

    expect(page).to have_content("is invalid")
    expect(User.count).to eq(@prev_count)
  end

end
