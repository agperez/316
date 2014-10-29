class CreateEmailcontents < ActiveRecord::Migration
  def change
    create_table :email_contents do |t|
      t.string :email
      t.text :text
    end
  end
end
