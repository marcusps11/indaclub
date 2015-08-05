class User < ActiveRecord::Base
  has_secure_password
  acts_as_voter
  has_many :events 
  has_many :clubs
  validates :username, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true 
end
