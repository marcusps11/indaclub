class Club < ActiveRecord::Base
  has_many :events
  belongs_to :user
  validates :name, presence:true
  # validates :location, presence:true
  # validates :description, presence:true, uniquness:true
end



