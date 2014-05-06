class CreateRolesTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :name
    	t.string :color
    end
  end
end
