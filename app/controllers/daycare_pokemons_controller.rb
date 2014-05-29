class DaycarePokemonsController < ApplicationController
  def index
    @daycare_pokemon = DaycarePokemon.new
    @genders = [{label: "Genderless", value: 0}, {label: "Male", value: 1}, {label: "Female", value: 2}]
  end

  def create
    @daycare_pokemon = DaycarePokemon.new(daycare_pokemon_params)

    redirect_to daycare_pokemons_path
  end

  private
  def daycare_pokemon_params
    params.require(:daycare_pokemon).permit(
      :nickname, :pokemon_id, :ability_id, :nature_id,
      :hp_iv, :atk_iv, :def_iv, :spa_iv, :spd_iv, :spe_iv, :gender,
      :move1, :move2, :move3, :move4
      ).merge(user: current_user)
  end
end
