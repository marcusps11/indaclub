class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.boolean :attending

      t.timestamps null: false
    end
  end
end
