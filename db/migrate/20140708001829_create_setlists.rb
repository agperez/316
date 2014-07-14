class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.date :date

      t.timestamps
    end
  end
end
