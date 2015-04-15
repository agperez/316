class AddCreatedAtToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :created_at, :datetime
  end
end
