class AddAddressToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :address2, :city
    add_column :users, :state, :string
    add_column :users, :zip, :integer
  end
end
