class DaycarePokemon < ActiveRecord::Base
  belongs_to :pokemon
  belongs_to :ability
  belongs_to :nature
  belongs_to :moveset
  belongs_to :gender

  validates_presence_of :nickname, :pokemon,
    :ability, :nature, :moveset, :gender,
    :hp_iv, :atk_iv, :def_iv, :spa_iv, :spd_iv, :spe_iv

end
