class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :artist
      t.string :city
      t.string :medium
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
