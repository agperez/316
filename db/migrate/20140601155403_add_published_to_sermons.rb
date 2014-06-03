class AddPublishedToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :published, :boolean
  end
end
