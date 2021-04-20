class RemoveUpdatedAtFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :updated_at, :datetime
  end
end
