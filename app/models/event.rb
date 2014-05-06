class Event < ActiveRecord::Base
	belongs_to :user, autosave: true
	belongs_to :team, autosave: true
	belongs_to :role, autosave: true
end
