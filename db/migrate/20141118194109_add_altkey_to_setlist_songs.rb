class AddAltkeyToSetlistSongs < ActiveRecord::Migration
  def change
    add_column :setlist_songs, :altkey, :string
  end
end
