class AddRoleRefToEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :role, index: true
  end
end
