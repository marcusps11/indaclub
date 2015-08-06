class AddGraffitiImageToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :club_image, :string
  end
end
