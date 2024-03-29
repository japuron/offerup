class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_title, :string
  attribute :item_picture, :string
  attribute :item_price, :float
  attribute :category_id, :integer
  attribute :item_description, :string
  attribute :seller_id, :integer
  attribute :comment_id, :integer

  # Direct associations

  belongs_to :comment

  belongs_to :category

  belongs_to :seller,
             resource: UserResource

  # Indirect associations
end
