class AddSiteNameToCourts < ActiveRecord::Migration
  def change
    add_column :courts, :site_name, :string
  end
end
