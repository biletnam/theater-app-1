# LPL Theater App

This CRUD app models a system used by a movie theater to track its showtimes and ticket sales.

## Configuration
	For successful email output, set a valid username and password to your environment using ENV[SG_USERNAME] and ENV[SG_PASSWORD] as keys.

## Version Info
* Rails 5.0.1
* Ruby 2.3.0 or later
* SQLite3 for development and test, PostgreSQL for production

## Deployment
Run `bundle install`, then `bundle exec rake db:create` then `bundle exec rake db:migrate`.  A seed file has been provided for demonstration purposes.  To seed the database, run `bundle exec rake db:seed`.

## Design
![Alt text](https://s3.us-east-2.amazonaws.com/lpltheaterapp/schema.png "DB Schema")