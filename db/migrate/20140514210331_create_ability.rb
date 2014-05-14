class CreateAbility < ActiveRecord::Migration
  def up
    create_table :abilities do |t|
      # id,identifier,generation_id,is_main_series
      t.string :identifier,       null: false
      t.references :generation,   null: false
      t.integer :is_main_series,  null: false
    end

    # mass import using the activerecord-import gem
    ability_inserts = []
    file = File.join(File.expand_path(Rails.root), "/db/csv/abilities.csv")
    CSV.foreach(file, headers: true) do |row|
      ability_inserts << Ability.new(row.to_hash)
    end

    Ability.import(ability_inserts)
  end

  def down
    drop_table :abilities
  end
end
