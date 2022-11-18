class Item < ApplicationRecord
  　#１つのジャンルに属している
  belongs_to :genre
    # カートに入った商品たちを持っている
  has_many :cart_items, dependent: :destroy
    # 注文詳細たちを持っている
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image
 
end
