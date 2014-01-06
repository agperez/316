class AddOutlineToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :outline, :text
  end
  def down
  	remove_column :sermons, :outline
  end
end
