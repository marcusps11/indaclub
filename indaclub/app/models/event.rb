class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :club
  validates :name, presence:true
  validates :date, presence:true
end
