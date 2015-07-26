class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image_name
    end
  end
end
