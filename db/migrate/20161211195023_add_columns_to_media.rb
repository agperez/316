class AddColumnsToMedia < ActiveRecord::Migration
  def change
    add_column :media, :title, :string
    add_column :media, :episode_number, :integer
  end
end
