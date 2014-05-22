class AddExceptionToEvents < ActiveRecord::Migration
  def up
    add_column :events, :exception, :boolean
  end
  def down
  	remove_column :events, :exception
  end
end