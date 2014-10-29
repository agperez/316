class AddPrivacyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hide_email, :boolean, :default => false
    add_column :users, :hide_phone, :boolean, :default => false
    add_column :users, :hide_address, :boolean, :default => false
  end
end
