class Item < ApplicationRecord
  mount_base64_uploader :item_picture, ItemPictureUploader

  # Direct associations

  belongs_to :comment

  belongs_to :category

  belongs_to :seller,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item_title
  end
end
