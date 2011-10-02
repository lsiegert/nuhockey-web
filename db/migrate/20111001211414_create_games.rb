class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :_id
      t.date :date
      t.string :season
      t.string :opponent
      t.integer :nuscore
      t.integer :oppscore
      t.string :location
      t.boolean :deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
