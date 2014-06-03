class AddTextcolorToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :text_color, :string
  end
  def down
  	remove_column :roles, :text_color
  end
end
