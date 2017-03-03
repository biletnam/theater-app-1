# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


9.times { Movie.create!(title: Faker::Book.title, director: Faker::Name.name, synopsis: Faker::Lorem.sentence, run_time: Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%lh%Mm")) }
puts "Movies successfully seeded!"

3.times { Auditorium.create!(name: Faker::Lorem.word, capacity: rand(100..300))}
puts "Auditoria successfully seeded!"

20.times { Customer.create!(name: Faker::Name.name, email: Faker::Internet.email, cc_number: Faker::Number.number(16), cc_expiration_date: Faker::Date.between(Date.today + 1, 4.year.from_now))}
puts "Customers successfully seeded!"

100.times do 
	showtime = Showtime.new(date: Faker::Date.forward(7), time: Faker::Time.between(DateTime.now - 1, DateTime.now))
	showtime.movie = Movie.all.sample
	showtime.auditorium = Auditorium.all.sample
	showtime.save!
end
puts "Showtimes successfully seeded!"

60.times do 
	sale = Sale.new(total_bill: Faker::Number.decimal(2), confirmation_no: rand(999999))
	sale.customer = Customer.all.sample
	sale.showtime = Showtime.all.sample
	sale.save!
end
puts "Sales successfully seeded!"