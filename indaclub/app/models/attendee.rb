class Attendee < ActiveRecord::Base
  has_one :event
  has_one :user
end
