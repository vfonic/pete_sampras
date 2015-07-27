Rake::Task['import_banner_data_from_csv:import_all_to_separate_tables']
  .invoke('spec/data/impressions.csv','spec/data/conversions.csv','spec/data/clicks.csv')
