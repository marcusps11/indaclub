class Event < ActiveRecord::Base

  belongs_to :club
  has_many :attendees
  validates :name, presence:true
  # validates :date, presence:true

#   def self.search(search)
#    if search
#     find(:all, :conditions => ["name LIKE ?", "%#{params[:search}%"])
#   else
#     find(:all)

#   end

# end
end
