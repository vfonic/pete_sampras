require 'csv'

namespace :import_banner_data_from_csv do
  desc "Import clicks to separate db table"
  task :clicks_to_clicks_table, [:clicks_file] => [:environment] do |_, args|
    clicks_file = Rails.root + args.clicks_file

    data = []
    CSV.foreach(clicks_file, headers: true) do |row|
      row_hash = row.to_hash
      data << "(#{row_hash['click_id']}, #{row_hash['banner_id']}, #{row_hash['campaign_id']})"
    end

    sql = "INSERT INTO clicks (id, banner_id, campaign_id) VALUES #{data.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end
end
