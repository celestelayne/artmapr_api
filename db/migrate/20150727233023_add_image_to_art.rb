class AddImageToArt < ActiveRecord::Migration
  def change
    add_column :arts, :photo_file_name, :string
    add_column :arts, :photo_content_type, :string
    add_column :arts, :photo_file_size, :integer
  end
end
