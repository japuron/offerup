class AddUserLocationLongitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_location_longitude, :float
  end
end
