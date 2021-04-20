class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :status
      t.integer :total_payment
      t.integer :payment_method
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
