class Address < ApplicationRecord
  # 1人のcustomerに属している
  belongs_to :customer

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
