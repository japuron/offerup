require "open-uri"
class User < ApplicationRecord
  before_validation :geocode_user_location

  def geocode_user_location
    if user_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(user_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.user_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.user_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.user_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end

  include JwtToken
  # Direct associations

  has_many   :comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :items,
             foreign_key: "seller_id",
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
