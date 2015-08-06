class Club < ActiveRecord::Base
  mount_uploader :club_image, ClubImageUploader
  has_many :events
  belongs_to :user
  validates :name, presence:true
  # validates :location, presence:true
  # validates :description, presence:true, uniquness:true
end



