class CreateSetlistSongTable < ActiveRecord::Migration
  def change
    create_table :setlist_songs do |t|
      t.belongs_to :setlist
      t.belongs_to :song
      t.datetime :setlist_songs_date
      t.timestamps
    end
  end
end
