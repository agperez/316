class AddSlugToMedia < ActiveRecord::Migration
  def change
    add_column :media, :slug, :string
    add_index :media, :slug

  end
end
