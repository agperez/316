class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :video
      t.string :audio
    end
  end
end
