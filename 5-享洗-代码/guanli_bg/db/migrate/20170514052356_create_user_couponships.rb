class CreateUserCouponships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_couponships do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.integer :is_del, :null => false, :default => 0

      t.timestamps
    end
  end
end
