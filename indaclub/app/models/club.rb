class Club < ActiveRecord::Base
  has_many :events
  has_many :users, through: :events 
  validates :name, presence: true, uniqueness: true
  # validates :location, presence:true
  # validates :description, presence:true



end
