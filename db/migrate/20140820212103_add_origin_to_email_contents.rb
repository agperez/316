class AddOriginToEmailContents < ActiveRecord::Migration
  def change
    add_column :email_contents, :origin, :string
    add_column :email_contents, :recipient, :string
  end
end
