class User < ActiveRecord::Base
  has_many :events 
  has_many :clubs, through: :events
  validates :username, presence:true
  validates :email, presence:true 
end
