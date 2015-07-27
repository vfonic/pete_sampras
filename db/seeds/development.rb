Rake::Task['import_banner_data_from_csv:import_all_to_separate_tables']
  .invoke('private/impressions_1.csv','private/conversions_1.csv','private/clicks_1.csv')
