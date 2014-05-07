require 'spec_helper'

feature 'home page' do

  scenario 'user is directed to home#index as root' do
    visit root_path

    expect 'Welcome to Daycare'
  end

end
