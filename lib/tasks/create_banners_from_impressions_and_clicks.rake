namespace :import_banner_data_from_csv do
  desc "Create banners from impressions and clicks"
  task :create_banners => :environment do
    impressions = Impression.select(:banner_id).to_sql
    clicks = Click.select(:banner_id).to_sql

    union_query = "#{impressions} UNION #{clicks}"

    banners = ActiveRecord::Base.connection.execute union_query

    data = []
    banners.each do |banner|
      banner_id = banner['banner_id']
      image_name = generate_image_name(id: banner_id)
      data << "(#{banner_id}, '#{image_name}')"
    end

    sql = "INSERT INTO banners (id, image_name) VALUES #{data.join(', ')}"

    banners = ActiveRecord::Base.connection.execute sql
  end

  def generate_image_name(id:)
    "image_#{id}.png.jpg"
  end
end
