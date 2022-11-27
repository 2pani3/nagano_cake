class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null:false
      t.integer :shipping_fee, null:false
      t.string :shipping_postcode, null:false
      t.string :shipping_address, null:false
      t.string :shipping_name, null:false
      t.integer :status, default:0,null:false,limit:1
      t.integer :payment_way, default:0,null:false,limit:1
      t.integer :total_payment, null:false
      t.timestamps
    end
  end
end
