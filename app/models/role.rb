class Role < ActiveRecord::Base
	has_many :events, autosave: true
	has_many :users, autosave: true 

	accepts_nested_attributes_for :events, :users

=begin
	before_save do
		self.text_color = adjust_fontColor(self.color)
	end


	def adjust_fontColor(color)
		case color
		when "#59BA53" #green
			return "#ffffff"
		when "#9FE1E7" #light-blue
			return "#ffffff"
		when "#F8B0C8" #pink
			return "#ffffff"
		when "#D5BB2A" #yellow
			return "#000000"
		when "#9FC6E7" #blue-gray
			return "#ffffff"
		when "#4986E7" #blue
			return "#ffffff"
		when "#9A9CFF" #purple
			return "#ffffff"
		when "#FFAD46" #orange
			return "#ffffff"
		when "#D06B64" #red
			return "#ffffff"										
		else
			return "#ffffff"
		end
	end

=end


end
