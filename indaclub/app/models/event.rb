class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :club
  validates :name, presence:true
  validates :date, presence:true

#   def self.search(search)
#    if search
#     find(:all, :conditions => ["name LIKE ?", "%#{params[:search}%"])
#   else
#     find(:all)

#   end

# end
end
