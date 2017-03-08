# LPL Theater App

This CRUD app models a system used by a movie theater to track its showtimes and ticket sales.

## Version Info
* Rails 5.0.1
* Ruby 2.3.0 or later
* SQLite3 for development and test, PostgreSQL for production

## Deployment
Run `bundle install`, then `bundle exec rake db:create` then `bundle exec rake db:migrate`.  A seed file has been provided for demonstration purposes.  To seed the database, run `bundle exec rake db:seed`.

## Configuration
	For successful email output, set a valid username and password to your environment using ENV[SG_USERNAME] and ENV[SG_PASSWORD] as keys.

## Design
![Alt text](https://s3.us-east-2.amazonaws.com/lpltheaterapp/schema.png "DB Schema")

The database was structured so that tangible assets (Movies, Auditoria, Customers) were related through ticketed Sales and scheduled Showtimes.

A Movie can have *many* Showtimes, but a Showtime has *one* Movie.
An Auditorium can be used for *many* Showtimes, but a Showtime pertains to *one* Auditorium.
A Showtime can have *many* ticket Sales, but a ticket Sale is for *one* Showtime.
A Customer can make *many* ticket Sales, but a ticket Sale has *one* Customer.
A Customer can attend *many* Showtimes; a Showtime can have *many* Customers.
A Movie can be shown in *many* Auditoria; an Auditorium can show *many* Movies.

### Models
#### Showtime Notes
To allow SQL queries to be made sorted by date and then by time, the Showtimes table was constructed with a separate field for date and for time.  Other approaches might be more space efficient, but barring any performance requirement, this is what was simplest for me.  

#### Sale Notes
To limit the number of ticket sales to the auditorium's capacity, I placed a check in the Sale creation route and also an ActiveRecord validation as a failsafe.  Once the Sale entry is successfully persisted, the mailer engages to send the ticket to the Customer.

#### Customer Notes
Although a separate table is not strictly required to flesh out this schema (since a different implementation might lump the customer information in with the associated Sale record), I chose to make this two separate tables, since a more realistic project would call for authorization of the Customer and back-end processing of the credit card information. 

Because there is no Customer authorization built in, each Customer interaction is treated completely independently of another.  Therefore, there may be duplicate records of Customer information.

Because hypothetically the credit card information will stored for later use to be processed through a credit card processor, I did not obfuscate the credit card number.

#### Movie and Auditorium Notes
These models are run-of-the-mill models.  Nothing special.  All standard CRUD routes are provided.

### Admin Tasks
For ease of navigation, I've provided links to access the Admin tasks from any view.  However, I have made it so that the Admin routes are not dependent on the consumer-facing routes and views.  However, at the conclusion of some actions where it makes sense, the endpoint is sometimes a consumer-facing view, such as when a new Showtime or Movie record is created or edited.  It remains though that in order to initiate an Admin Task, one must navigate through the admin views.

