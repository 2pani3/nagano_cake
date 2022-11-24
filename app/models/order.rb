class Order < ApplicationRecord
    # 1人のcustomerに属している
  belongs_to :customer
    # 注文詳細たちを持っている
  has_many :order_details, dependent: :destroy
  # enimの記述
  enum status: { weiting: 0, check: 1, making: 2, prepare: 3, complete: 4 }
  enum payment_way: { credit_card: 0, transfer: 1 }

  validates :shipping_postcode,:shipping_address,:shipping_name, presence: true, if: :select_address_new?

  def tax_price
    (price*1.1).floor
  end
end
