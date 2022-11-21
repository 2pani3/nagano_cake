class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # customerが多数持っている
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  # has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :last_name_kana, presence:true
  validates :first_name_kana, presence:true
  validates :postcode, presence:true ,length: { is: 7 }
  validates :address, presence:true
  validates :phone_number, presence:true

end
