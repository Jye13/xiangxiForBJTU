class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :price1
      t.decimal :price2
      t.decimal :price3
      t.decimal :price4
      t.decimal :price5
      t.decimal :price6
      t.string  :region1
      t.string  :region2
      t.string  :region3
      t.string  :region4
      t.string  :region5
      t.string  :region6

      t.timestamps
    end
  end
end
