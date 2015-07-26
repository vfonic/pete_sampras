namespace :import_banner_data_from_csv do
  desc "Create campaigns from impressions and clicks"
  task :create_campaigns => :environment do
    impressions = Impression.select(:campaign_id).to_sql
    clicks = Click.select(:campaign_id).to_sql

    union_query = "#{impressions} UNION #{clicks}"

    campaigns = ActiveRecord::Base.connection.execute union_query

    data = []
    campaigns.each do |campaign|
      data << "(#{campaign['campaign_id']})"
    end

    sql = "INSERT INTO campaigns (id) VALUES #{data.join(', ')}"

    campaigns = ActiveRecord::Base.connection.execute sql
  end
end
