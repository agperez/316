class Setlist < ActiveRecord::Base
  has_many :setlist_songs, -> { order(:position) }
  has_many :songs, through: :setlist_songs

  validates :date, presence: true
end
