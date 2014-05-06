class Team < ActiveRecord::Base
	has_many :users, autosave: true
	has_many :events, autosave: true
	accepts_nested_attributes_for :users, :events
end
