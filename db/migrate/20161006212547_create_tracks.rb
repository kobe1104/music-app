class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_type
      t.string :song
      t.timestamps null: false
    end
  end
end
