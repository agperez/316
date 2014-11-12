class AddPositionToSetlistSongs < ActiveRecord::Migration
  def change
    add_column :setlist_songs, :position, :integer
  end
end
