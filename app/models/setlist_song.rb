class SetlistSong < ActiveRecord::Base
  belongs_to :setlist
  belongs_to :song

  validates :song_id, presence: true
  validates :setlist_id, presence: true

  acts_as_list :scope => :setlist

  before_save :set_altkey

  def set_altkey
    if self.altkey.nil?
      self.altkey = Song.find(self.song_id).key
    end
  end
end
