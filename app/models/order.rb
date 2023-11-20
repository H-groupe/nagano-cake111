class Order < ApplicationRecord
  
  belongs_to :customer
   has_many :cart_items
  
   enum payment_method: { credit_card: 0, transfer: 1 }
   enum status: { waiting: 0, paid_up:1, in_production:2, preparing:3, shipped:4}
  
end
