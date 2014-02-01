class AddAnnouncementsToSermons < ActiveRecord::Migration
  def up
    add_column :sermons, :announcements, :string
  end
  def down
  	remove_column :sermons, :announcements
  end
end
