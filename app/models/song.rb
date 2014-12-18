class Song < ActiveRecord::Base
  has_many :setlist_songs
  has_many :setlists, through: :setlist_songs

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
end
