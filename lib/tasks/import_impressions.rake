require 'csv'

namespace :import_banner_data_from_csv do
  desc "Import impressions to separate db table"
  task :impressions_to_impressions_table, [:impressions_file] => [:environment] do |_, args|
    impressions_file = Rails.root + args.impressions_file

    data = []
    CSV.foreach(impressions_file, headers: true) do |row|
      row_hash = row.to_hash
      data << "(#{row_hash['banner_id']}, #{row_hash['campaign_id']})"
    end

    sql = "INSERT INTO impressions (banner_id, campaign_id) VALUES #{data.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end
end
