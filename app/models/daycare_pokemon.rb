class DaycarePokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
  belongs_to :ability
  belongs_to :nature

  validates_presence_of :nickname, :pokemon,
    :ability, :nature, :gender,
    :hp_iv, :atk_iv, :def_iv, :spa_iv, :spd_iv, :spe_iv

  validates :gender, inclusion: 0..2, numericality: { only_integer: true }
end
