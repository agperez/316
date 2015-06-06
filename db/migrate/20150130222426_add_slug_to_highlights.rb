class AddSlugToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :slug, :string
    add_index :highlights, :slug
  end
end
