class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :track, null: false
      t.integer :band_id, null: false
      t.string :style
      t.timestamps null: false
    end
  end
end
