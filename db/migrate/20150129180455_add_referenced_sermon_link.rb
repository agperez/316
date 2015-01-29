class AddReferencedSermonLink < ActiveRecord::Migration
  def change
    add_column :highlights, :sermon_link, :string
  end
end
