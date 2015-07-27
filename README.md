Pete Sampras
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

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


License
-------
MIT
