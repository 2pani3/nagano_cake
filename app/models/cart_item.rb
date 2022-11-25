class CartItem < ApplicationRecord
    # 1人のcustomerに属している
  belongs_to :customer
    # 1つのitemに属している
  belongs_to :item

  validates :amount, presence: true

end
