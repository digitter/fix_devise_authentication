class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.integer :postal_code
      t.string :address
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
