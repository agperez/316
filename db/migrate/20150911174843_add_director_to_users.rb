class AddDirectorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :director, :boolean, default: false
  end
end
