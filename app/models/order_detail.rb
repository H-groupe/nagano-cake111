class OrderDetail < ApplicationRecord
  
    enum making_status: { impossible: 0, wait: 1, start: 2, finish: 3 }
  
end
