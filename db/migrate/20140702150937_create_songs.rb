class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :key
      t.text :chart

      t.timestamps
    end
  end
end
