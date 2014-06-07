require 'spec_helper'

describe DaycarePokemon do

  context 'associations and validations' do
    it { should validate_presence_of :nickname }

    it { should belong_to :user }

    it { should belong_to :pokemon }
    it { should belong_to :ability }
    it { should belong_to :nature }

    it { should have_valid(:gender).when(0,1,2) }
    it { should_not have_valid(:gender).when(-1,-2,0.5,1.5,2.5,3,4,5,nil,'string') }
  end

  context 'methods' do
    let(:daycare_pokemon) { FactoryGirl.build(:daycare_pokemon) }
    it 'should return a moveset as an array' do
      moveset = [
        daycare_pokemon.move1,
        daycare_pokemon.move2,
        daycare_pokemon.move3,
        daycare_pokemon.move4
      ]

      expect(daycare_pokemon.moveset).to eq(moveset)
    end

    it 'should return an IV spread as a hash' do
      iv_spread = {
        hp: daycare_pokemon.hp_iv,
        atk: daycare_pokemon.atk_iv,
        def: daycare_pokemon.def_iv,
        spa: daycare_pokemon.spa_iv,
        spd: daycare_pokemon.spd_iv,
        spe: daycare_pokemon.spe_iv
      }

      expect(daycare_pokemon.iv_spread).to eq(iv_spread)
    end

  end

end
