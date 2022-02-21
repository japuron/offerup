json.extract! item, :id, :item_title, :item_picture, :item_price, :category_id, :item_description, :seller_id, :comment_id, :created_at, :updated_at
json.url item_url(item, format: :json)
