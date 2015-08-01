class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :bio
      t.text :avatar

      t.timestamps null: false
    end
  end
end
