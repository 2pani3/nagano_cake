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
end
