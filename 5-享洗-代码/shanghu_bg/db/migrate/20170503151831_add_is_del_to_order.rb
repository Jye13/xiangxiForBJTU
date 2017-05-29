class AddIsDelToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :merchant_orderships, :is_del, :integer, :null => false, :default => 0
  end
end
