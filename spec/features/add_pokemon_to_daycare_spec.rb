require 'spec_helper'

feature 'user can add a new Pokemon to the Daycare' do

  # Acceptance
  # Data a 'DaycarePokemon' encompasses:
  # - Nickname
  # - Species
  # - Ability
  # - Nature
  # - IV Spread
  # - Moveset (4 moves)
  # - Gender

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
  end

  scenario 'create valid Daycare Pokemon' do
    visit '/daycare/'

    fill_in 'Nickname', with: 'Steve'
    fill_in 'Pokemon', with: 'Bulbasaur'
    fill_in 'Ability', with: 'Overgrow'
    fill_in 'Nature', with: 'Hardy'
    check 'ATK'
    check 'DEF'
    check 'SPE'
    fill_in 'Move 1', with: 'Leaf Storm'
    fill_in 'Move 2', with: 'Grassy Terrain'
    fill_in 'Move 3', with: 'Petal Dance'
    fill_in 'Move 4', with: 'Skull Bash'
    choose 'Male'

    click_on 'New'

    expect(user.daycare_pokemon.count).to eq(1)
  end

end
