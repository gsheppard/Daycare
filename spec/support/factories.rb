FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "dean_#{n}_winchester@email.com"}
    sequence(:display_name) { |n| "dean_#{n}_winchester" }
    password 'password'
    password_confirmation 'password'
  end

  factory :daycare_pokemon do
    nickname 'Sebastian'
    pokemon_id 25
    ability Ability.first
    nature Nature.first
    gender 1
    hp_iv true
    atk_iv false
    def_iv true
    spa_iv false
    spd_iv true
    spe_iv false

    move1_id 10
    move2_id 20
    move3_id 30
    move4_id 40

    user
  end

end
