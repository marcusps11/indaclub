class DropUserEventTable < ActiveRecord::Migration
  def change
    drop_table :join_user_events
  end
end
