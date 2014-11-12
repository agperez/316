class SetlistSong < ActiveRecord::Base
  belongs_to :setlist
  belongs_to :song

  acts_as_list :scope => :setlist
end
