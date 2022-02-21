class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_title
      t.string :item_picture
      t.float :item_price
      t.integer :category_id
      t.string :item_description
      t.integer :seller_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
