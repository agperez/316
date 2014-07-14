class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_link, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone, :integer
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :spouse, :string
  end
end
