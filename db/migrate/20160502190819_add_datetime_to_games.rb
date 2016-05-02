class AddDatetimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :datetime, :datetime
    remove_column :games, :date, :date
    remove_column :games, :time, :time
  end
end
