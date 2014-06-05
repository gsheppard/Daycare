class DaycarePokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
  belongs_to :ability
  belongs_to :nature

  belongs_to :move1, class_name: "Move", foreign_key: "move1_id", primary_key: "id"
  belongs_to :move2, class_name: "Move", foreign_key: "move2_id", primary_key: "id"
  belongs_to :move3, class_name: "Move", foreign_key: "move3_id", primary_key: "id"
  belongs_to :move4, class_name: "Move", foreign_key: "move4_id", primary_key: "id"

  validates_presence_of :nickname, :pokemon,
    :ability, :nature, :gender

  validates :gender, inclusion: 0..2, numericality: { only_integer: true }

  def gender_word
    case self.gender
    when 0
      'Genderless'
    when 1
      'Male'
    when 2
      'Female'
    end
  end
end
