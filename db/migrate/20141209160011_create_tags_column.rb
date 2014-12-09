class CreateTagsColumn < ActiveRecord::Migration
  def change
    add_column :sermons, :tags, :string
  end
end
