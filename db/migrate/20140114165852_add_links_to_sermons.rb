class AddLinksToSermons < ActiveRecord::Migration
  def up
    add_column :sermons, :link, :text
  end
  def down
  	remove_column :sermons, :link
  end
  
end
