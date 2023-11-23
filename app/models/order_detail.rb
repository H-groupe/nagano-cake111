class OrderDetail < ApplicationRecord

    belongs_to :order
    belongs_to :item

    enum making_status: { impossible: 0, wait: 1, start: 2, finish: 3 }

    validates :price_including_tax, presence: true

    # def with_tax_price
    # (price_including_tax * 1.1).floor
    # end

end
