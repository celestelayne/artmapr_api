class AddVariousToArts < ActiveRecord::Migration
  def change
    add_column :arts, :circa_year, :integer
    add_column :arts, :provider_id, :string
    add_column :arts, :provider_name, :string
  end
end
