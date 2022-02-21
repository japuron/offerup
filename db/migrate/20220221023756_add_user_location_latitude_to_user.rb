class AddUserLocationLatitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_location_latitude, :float
  end
end
