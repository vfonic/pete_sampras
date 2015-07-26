require 'csv'

namespace :import_banner_data_from_csv do
  desc "Import impressions, clicks and conversions from CSV files"
  task :import_all => [:import_impressions, :import_clicks_and_conversions]

  desc "Import impressions from impressions CSV file"
  task :import_impressions => :environment do
    impressions_file = Rails.root + 'private/impressions_1.csv'

    data = []
    CSV.foreach(impressions_file, headers: true) do |row|
      row_hash = row.to_hash
      data << "(#{row_hash['banner_id']}, #{row_hash['campaign_id']})"
    end

    sql = "INSERT INTO serves (banner_id, campaign_id) VALUES #{data.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end

  desc "Import clicks and conversions from CSV files"
  task :import_clicks_and_conversions => :environment do
    clicks_file = Rails.root + 'private/clicks_1.csv'
    conversions_file = Rails.root + 'private/conversions_1.csv'

    clicks = {}
    CSV.foreach(clicks_file, headers: true) do |row|
      row_hash = row.to_hash
      clicks[row_hash['click_id']] = row_hash
    end

    CSV.foreach(conversions_file, headers: true) do |row|
      row_hash = row.to_hash
      clicks[row_hash['click_id']].merge!(row_hash)
    end

    data = []
    clicks.values.each do |row|
      data << "(#{row['click_id']}, #{row['banner_id']}, #{row['campaign_id']}, #{row['conversion_id'] || 'null'}, #{row['revenue'] || 'null'})"
    end

    sql = "INSERT INTO serves (click_id, banner_id, campaign_id, conversion_id, revenue) VALUES #{data.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end
end
