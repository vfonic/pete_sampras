namespace :import_banner_data_from_csv do
  desc "Import impressions, clicks and conversions to separate db tables"
  task :import_all_to_separate_tables => 
  [
    :impressions_to_impressions_table,
    :conversions_to_conversions_table,
    :clicks_to_clicks_table,
    :create_campaigns,
    :create_banners
  ]
end
