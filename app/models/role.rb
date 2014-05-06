class Role < ActiveRecord::Base
	has_many :events, autosave: true
	has_many :users, autosave: true 

	accepts_nested_attributes_for :events, :users
end
