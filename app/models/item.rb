class Item < ApplicationRecord
  # Direct associations

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item_title
  end

end
