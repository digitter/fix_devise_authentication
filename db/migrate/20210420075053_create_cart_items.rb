class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
