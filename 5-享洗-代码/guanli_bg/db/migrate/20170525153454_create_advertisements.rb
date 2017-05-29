class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.integer :product_id
      t.string :ad_logo

      t.timestamps
    end
  end
end
