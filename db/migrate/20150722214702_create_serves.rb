class CreateServes < ActiveRecord::Migration
  def change
    create_table :serves do |t|
      t.integer :banner_id
      t.integer :campaign_id
      t.integer :click_id
      t.integer :conversion_id
      t.decimal :revenue, precision: 15, scale: 10
    end
    add_index :serves, :campaign_id
    add_index :serves, :click_id
  end
end
