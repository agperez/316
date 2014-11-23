class CreateWorshipRoles < ActiveRecord::Migration
  def change
    create_table :worship_roles do |t|
      t.string :name
    end
  end
end
