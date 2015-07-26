class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.integer :click_id
      t.decimal :revenue, precision: 15, scale: 10

      t.timestamps null: false
    end
    add_index :conversions, :click_id
  end
end
