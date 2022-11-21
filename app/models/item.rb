class Item < ApplicationRecord
  　#１つのジャンルに属している
  belongs_to :genre
    # カートに入った商品たちを持っている
  has_many :cart_items, dependent: :destroy
    # 注文詳細たちを持っている
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image

  validates :genre_id, presence:true
  validates :name, presence:true
  validates :description, presence:true
  validates :price, presence:true

  def get_item_image(width, height)
  unless item_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  item_image.variant(resize_to_limit: [width, height]).processed
  end


end
