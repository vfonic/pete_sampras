class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.integer :click_id
      t.decimal :revenue, precision: 15, scale: 10
    end
    add_index :conversions, :click_id
  end
end
