class Event < ActiveRecord::Base
acts_as_votable
mount_uploader :event_image, EventImageUploader
  belongs_to :user
  belongs_to :club
  validates :name, presence:true
  validates :date, presence:true

  def score
    self.get_upvotes.size
  end

end
