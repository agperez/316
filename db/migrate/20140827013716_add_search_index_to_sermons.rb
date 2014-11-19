class AddSearchIndexToSermons < ActiveRecord::Migration
  def up
    execute "create index sermons_book on sermons using gin(to_tsvector('english', book))"
    execute "create index sermons_outline on sermons using gin(to_tsvector('english', outline))"
  end

  def down
    execute "drop index sermons_book"
    execute "drop index sermons_outline"
  end
end
