class Item < ApplicationRecord
  
  has_one_attached :item_image
  belongs_to :genre
  
  
  def get_item_image(width, height)
   unless item_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   item_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
  
end
