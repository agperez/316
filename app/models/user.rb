class User < ActiveRecord::Base
  
  belongs_to :team, autosave: true
  belongs_to :role, autosave: true
  has_many :events, autosave: true

  accepts_nested_attributes_for :events

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  after_save do
    self.events.each do |e|
      e.role_id = role_id
      e.team_id = team_id 
      e.save
    end
  end

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					  uniqueness: { case_sensitive: false }

  	has_secure_password
  	validates :password, length: { minimum: 6 }, :if => :password

  	def User.new_remember_token
  		SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
  		Digest::SHA1.hexdigest(token.to_s)
  	end
  	
  	private
  		
  		def create_remember_token
  			self.remember_token = User.encrypt(User.new_remember_token)
  		end
end
