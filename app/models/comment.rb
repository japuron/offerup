class Comment < ApplicationRecord
  # Direct associations

  has_many   :items,
             dependent: :destroy

  belongs_to :commenter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commenter.to_s
  end
end
