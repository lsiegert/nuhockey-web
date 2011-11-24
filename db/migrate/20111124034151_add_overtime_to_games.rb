class AddOvertimeToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :overtime, :boolean, :default => false
  end

  def self.down
    remove_column :games, :overtime
  end
end