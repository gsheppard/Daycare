require 'spec_helper'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end

Capybara.javascript_driver = :poltergeist

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

  def fill_autocomplete(field, options = {})
    fill_in field, with: options[:with]

    page.execute_script %Q{ $('##{field}').trigger('focus') }
    page.execute_script %Q{ $('##{field}').trigger('keydown') }
    selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}

    page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
  end

  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as(user)
  end

  scenario 'create valid Daycare Pokemon', js: true do
    visit '/daycare/'

    fill_in 'Nickname', with: 'Steve'
    fill_autocomplete 'pokemon_id_input', with: 'Bulba', select: 'Bulbasaur'
    fill_autocomplete 'ability_id_input', with: 'Overg', select: 'Overgrow'
    fill_autocomplete 'nature_id_input', with: 'Har', select: 'Hardy'
    check 'ATK'
    check 'DEF'
    check 'SPE'
    fill_autocomplete 'move1_id_input', with: 'Leaf Storm', select: 'Leaf Storm'
    fill_autocomplete 'move2_id_input', with: 'Grassy Terrain', select: 'Grassy Terrain'
    fill_autocomplete 'move3_id_input', with: 'Petal Dance', select: 'Petal Dance'
    fill_autocomplete 'move4_id_input', with: 'Skull Bash', select: 'Skull Bash'
    choose 'Male'

    click_on 'New'

    expect(user.daycare_pokemons.count).to eq(1)
  end

end
