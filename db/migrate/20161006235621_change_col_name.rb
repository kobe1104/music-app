class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :albums, :track, :album_name
    add_column :tracks, :album_id, :integer

  end
end
