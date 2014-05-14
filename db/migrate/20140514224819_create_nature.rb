class CreateNature < ActiveRecord::Migration
  def up
    create_table :natures do |t|
      # id,identifier,decreased_stat_id,increased_stat_id,hates_flavor_id,likes_flavor_id
      t.string :identifier,           null: false
      t.references :decreased_stat,   null: false
      t.references :increased_stat,   null: false
      t.references :hates_flavor,     null: false
      t.references :likes_flavor,     null: false
    end

    # mass import using the activerecord-import gem
    nature_inserts = []
    file = File.join(File.expand_path(Rails.root), "/db/csv/natures.csv")
    CSV.foreach(file, headers: true) do |row|
      nature_inserts << Nature.new(row.to_hash)
    end

    Nature.import(nature_inserts)
  end

  def down
    drop_table :natures
  end
end
