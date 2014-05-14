class DaycarePokemonsController < ApplicationController
  def index
    @daycare_pokemon = DaycarePokemon.new
  end
end
