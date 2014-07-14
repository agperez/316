class AddSermonRefToNotes < ActiveRecord::Migration
  def change
  	add_reference :notes, :sermon, index: true
  end
end
