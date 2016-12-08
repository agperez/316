class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string   :book
      t.integer  :chapter
      t.integer  :verse_first
      t.integer  :verse_last
      t.string   :video
      t.string   :audio
      t.string   :speaker
      t.date     :s_date
      t.text     :outline
      t.text     :link
      t.integer  :chapter_last
      t.string   :announcements
      t.boolean  :published
      t.string   :tags
      t.string   :type

      t.timestamps
    end
  end
end
