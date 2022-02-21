class AddCommentReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :comments
    add_index :items, :comment_id
    change_column_null :items, :comment_id, false
  end
end
