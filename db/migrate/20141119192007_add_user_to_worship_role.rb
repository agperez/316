class AddUserToWorshipRole < ActiveRecord::Migration
  def change
    add_reference :users, :worship_role, index: true
  end
end
