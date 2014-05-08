require 'spec_helper'

feature 'user cannot edit display name' do

  # user can see but not edit display name on edit page

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
    visit edit_user_registration_path
  end

  scenario 'expect edit page to have display name' do
    expect(page).to have_content(user.display_name)
  end

end
