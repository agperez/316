class AddOrderToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :order, :integer
  end
  def down
  	remove_column :roles, :order
  end
end
