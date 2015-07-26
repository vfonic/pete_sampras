class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.integer :banner_id
      t.integer :campaign_id
    end
    add_index :impressions, :banner_id
    add_index :impressions, :campaign_id
  end
end
