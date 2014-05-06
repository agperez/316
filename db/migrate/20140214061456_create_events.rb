class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.datetime :event_date

      t.timestamps
    end
  end
end
