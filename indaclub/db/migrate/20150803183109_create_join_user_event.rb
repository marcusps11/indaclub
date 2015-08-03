class CreateJoinUserEvent < ActiveRecord::Migration
  def change
    create_table :join_user_events do |t|
      t.string :event
      t.string :user
    end
  end
end
