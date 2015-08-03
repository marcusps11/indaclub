class User < ActiveRecord::Base
  has_secure_password
  has_many :events 
  has_many :clubs, through: :events
  has_one :attendees, through: :events
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true 
end
