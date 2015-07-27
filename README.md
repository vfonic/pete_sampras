Pete Sampras
================

[Pistol Pete](http://www.wikiwand.com/en/Pete_Sampras)

This application requires:

- Ruby 2.2.1
- Rails 4.2.1

Getting Started
---------------

Run the following command to setup development database and start server:

```
rake db:setup
rails server
```

Run the following commands to setup test database and run tests:

```
RAILS_ENV=test rake db:setup
rspec
```

Implementation Details/Thoughts
-------------------------------

* banner model specs should compute the data, not have the campaign and banner IDs hardcoded
* due to having test data for previous point in the test database, I resort to using `Banner.find()` instead of calling `FactoryGirl.create(:banner)`
* method `CampaignsController#set_banner` does too much. It would be better to split that functionality into several components
* method `CampaignsController#set_session_banners` does more than the name says. There should be an extra component for determining the logic how the banners should be returned (and we could easily replace it later with different logic if needed).
* relaying on relational database's huge join query for selecting the top banners might not be the best idea in the long run

License
-------
MIT
