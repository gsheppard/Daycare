class CreateDaycarePokemon < ActiveRecord::Migration
  def change
    create_table :daycare_pokemons do |t|
      t.string :nickname,         null: false
      t.references :pokemon,      null: false
      t.references :ability,      null: false
      t.references :nature,       null: false
      t.integer :gender,          null: false

      t.boolean :hp_iv,           null: false, default: false
      t.boolean :atk_iv,          null: false, default: false
      t.boolean :def_iv,          null: false, default: false
      t.boolean :spa_iv,          null: false, default: false
      t.boolean :spd_iv,          null: false, default: false
      t.boolean :spe_iv,          null: false, default: false

      t.integer :move1_id
      t.integer :move2_id
      t.integer :move3_id
      t.integer :move4_id

      t.references :user,         null: false

      t.timestamps
    end
  end
end
