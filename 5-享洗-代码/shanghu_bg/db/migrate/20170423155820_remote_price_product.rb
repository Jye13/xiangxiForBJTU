class RemotePriceProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price
  end
end
