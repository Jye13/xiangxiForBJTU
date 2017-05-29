class AddIsDeleteToMerchant < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :is_delete, :integer, :default => 0, :null => false
  end
end
