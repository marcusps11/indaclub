class DropAttendeesTable < ActiveRecord::Migration
  def change
    drop_table :attendees
  end
end
