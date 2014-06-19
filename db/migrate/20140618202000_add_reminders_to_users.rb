class AddRemindersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reminders, :boolean, :default => true
  end
end
