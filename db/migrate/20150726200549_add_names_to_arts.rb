class AddNamesToArts < ActiveRecord::Migration
  def change
    add_column :arts, :artist_last_name, :string
    add_column :arts, :artist_first_name, :string
  end
end
