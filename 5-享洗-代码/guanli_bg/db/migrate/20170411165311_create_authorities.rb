class CreateAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :authorities do |t|
      t.integer :is_del, :default => 0, :null => false
      t.text :comment, :null => false

      t.timestamps
    end
  end
end
