class AddStatusEgToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :status, :integer, :null => false, :default => 1
    add_column :merchants, :license, :string
  end
end
