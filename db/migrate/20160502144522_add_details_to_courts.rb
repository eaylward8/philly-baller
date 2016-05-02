class AddDetailsToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :url, :string
    add_column :courts, :council_district, :integer
    add_column :courts, :pcpc_district, :string
  end
end
