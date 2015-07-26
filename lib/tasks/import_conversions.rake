require 'csv'

namespace :import_banner_data_from_csv do
  desc "Import conversions to separate db table"
  task :conversions_to_conversions_table => :environment do
    conversions_file = Rails.root + 'private/conversions_1.csv'

    data = []
    CSV.foreach(conversions_file, headers: true) do |row|
      row_hash = row.to_hash
      data << "(#{row_hash['conversion_id']}, #{row_hash['click_id']}, #{row_hash['revenue']})"
    end

    sql = "INSERT INTO conversions (id, click_id, revenue) VALUES #{data.join(', ')}"

    ActiveRecord::Base.connection.execute sql
  end
end
