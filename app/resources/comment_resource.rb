class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :commenter_id, :integer
  attribute :comment, :string

  # Direct associations

  has_many   :items

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations
end
