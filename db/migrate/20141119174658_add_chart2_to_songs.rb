class AddChart2ToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :chart_alt, :text
  end
end
