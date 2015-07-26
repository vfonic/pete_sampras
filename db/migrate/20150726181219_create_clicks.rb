class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :banner_id
      t.integer :campaign_id
    end
    add_index :clicks, :banner_id
    add_index :clicks, :campaign_id
  end
end
