class AddChapterLastToSermons < ActiveRecord::Migration
  def up
    add_column :sermons, :chapter_last, :integer
  end
  def down
  	remove_column :sermons, :chapter_last
  end
end
