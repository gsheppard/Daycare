class CreateStat < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      # id,damage_class_id,identifier,is_battle_only,game_index
      t.references :damage_class
      t.string :identifier,         null: false
      t.integer :is_battle_only,    null: false
      t.integer :game_index
    end

    # mass import using the activerecord-import gem
    stats_inserts = []
    file = File.join(File.expand_path(Rails.root), "/db/csv/stats.csv")
    CSV.foreach(file, headers: true) do |row|
      stats_inserts << Stat.new(row.to_hash)
    end

    Stat.import(stats_inserts)
  end

  def down
    drop_table :stats
  end
end
