class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :user_location, :string

  # Direct associations

  has_many   :comments,
             foreign_key: :commenter_id

  has_many   :items,
             foreign_key: :seller_id

  # Indirect associations
end
