class RenameUsersDisabledColumn < ActiveRecord::Migration
  def change
    rename_column :users, :disabled, :deactivated
  end
end
