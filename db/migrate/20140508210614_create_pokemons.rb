class CreatePokemons < ActiveRecord::Migration
  def up
    create_table :pokemons do |t|
      # id,identifier,species_id,height,weight,base_experience,order,is_default
      # 1, bulbasaur, 1,         7,     69,    64,             1,    1
      t.string :identifier,         null: false
      t.references :species,        null: false
      t.integer :height,            null: false
      t.integer :weight,            null: false
      t.integer :base_experience,   null: false
      t.integer :order,             null: false
      t.integer :is_default,        null: false
    end

    # mass import using the activerecord-import gem
    pokemon_inserts = []
    file = File.join(File.expand_path(Rails.root), "/db/csv/pokemon.csv")
    CSV.foreach(file, headers: true) do |row|
      pokemon_inserts << Pokemon.new(row.to_hash)
    end

    Pokemon.import(pokemon_inserts)
  end

  def down
    drop_table :pokemons
  end
end
