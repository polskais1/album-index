# Setup

## Requirements

* Ruby 2.2.2 or later
* SQLite3
* Bundler 1.14.6 or later

## Getting up and running

Run `bundle install` to install all dependencies

Run `rake db:setup` to get your database setup and seeded

Run `rails s` to start up the server

Run `rspec` to run all tests

# Thoughts

Pagination and indexing will definitely be required if the app is to scale in size.

The seeded songs have pretty generic naming, but the test cases do use more specific names and titles