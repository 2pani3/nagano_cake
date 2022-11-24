class OrderDetail < ApplicationRecord
  # １つの商品,注文として属している
  belongs_to :item
  belongs_to :order
  # enum
  enum making_status: { impossible: 0, waiting: 1, making: 2, complete: 3 }, _prefix: true
end
