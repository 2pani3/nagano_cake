class Address < ApplicationRecord
  # 1人のcustomerに属している
  belongs_to :customer
end
