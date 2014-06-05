class DaycarePokemonsController < ApplicationController
  def index
    @daycare_pokemon = DaycarePokemon.new
    @genders = [{label: "Genderless", value: 0}, {label: "Male", value: 1}, {label: "Female", value: 2}]

    @daycare_pokemons = DaycarePokemon.where(user: current_user)
  end

  def create
    @daycare_pokemon = DaycarePokemon.new(daycare_pokemon_params)

    if @daycare_pokemon.save
      flash[:notice] = "It worked"
    else
      flash[:alert] = "It didn't work"
    end

    redirect_to daycare_pokemons_path
  end

  private
  def daycare_pokemon_params
    params.require(:daycare_pokemon).permit(
      :nickname, :pokemon_id, :ability_id, :nature_id,
      :move1_id, :move2_id, :move3_id, :move4_id,
      :hp_iv, :atk_iv, :def_iv, :spa_iv, :spd_iv, :spe_iv, :gender
      ).merge(user: current_user)
  end
end
