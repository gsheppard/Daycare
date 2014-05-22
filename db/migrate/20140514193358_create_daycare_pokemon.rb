class CreateDaycarePokemon < ActiveRecord::Migration
  def change
    create_table :daycare_pokemons do |t|
      t.string :nickname,         null: false
      t.references :pokemon,      null: false
      t.references :ability,      null: false
      t.references :nature,       null: false
      t.references :moveset,      null: false
      t.integer :gender,          null: false
      t.integer :hp_iv,           null: false, default: false
      t.integer :atk_iv,          null: false, default: false
      t.integer :def_iv,          null: false, default: false
      t.integer :spa_iv,          null: false, default: false
      t.integer :spd_iv,          null: false, default: false
      t.integer :spe_iv,          null: false, default: false
      t.references :user,         null: false

      t.timestamps
    end
  end
end
