class AddUserLocationFormattedAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_location_formatted_address, :string
  end
end
