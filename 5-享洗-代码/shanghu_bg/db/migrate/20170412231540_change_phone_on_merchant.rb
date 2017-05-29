class ChangePhoneOnMerchant < ActiveRecord::Migration[5.0]
  def change
    change_column :merchants, :mobile, :string
  end
end
