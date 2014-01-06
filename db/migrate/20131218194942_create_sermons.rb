class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :book
      t.integer :chapter
      t.integer :verse_first 
      t.integer :verse_last
      t.string :video
      t.string :audio
      t.string :speaker
      t.date :s_date

      t.timestamps
    end
  end
end
