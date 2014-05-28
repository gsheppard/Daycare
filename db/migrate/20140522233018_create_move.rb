class CreateMove < ActiveRecord::Migration
  def up
    create_table :moves do |t|
      # id,identifier,generation_id,type_id,power,pp,accuracy,
      # priority,target_id,damage_class_id,effect_id,effect_chance,
      # contest_type_id,contest_effect_id,super_contest_effect_id
      t.string :identifier, null: false
      t.integer :generation_id
      t.integer :type_id
      t.integer :power
      t.integer :pp
      t.integer :accuracy
      t.integer :priority
      t.integer :target_id
      t.integer :damage_class_id
      t.integer :effect_id
      t.integer :effect_chance
      t.integer :contest_type_id
      t.integer :contest_effect_id
      t.integer :super_contest_effect_id
    end

    # mass import using the activerecord-import gem
    moves_inserts = []
    file = File.join(File.expand_path(Rails.root), "/db/csv/moves.csv")
    CSV.foreach(file, headers: true) do |row|
      moves_inserts << Move.new(row.to_hash)
    end

    Move.import(moves_inserts)
  end

  def down
    drop_table :moves
  end
end
