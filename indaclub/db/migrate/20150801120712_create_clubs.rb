class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :location
      t.text :description
      t.text :image

      t.timestamps null: false
    end
  end
end
