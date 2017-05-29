class AddMerchantIdToStation < ActiveRecord::Migration[5.0]
  def change
      add_column :stations, :merchant_id, :integer
  end
end
