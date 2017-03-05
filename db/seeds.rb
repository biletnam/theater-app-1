# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


9.times { Movie.create!(title: Faker::Book.title, director: Faker::Name.name, synopsis: Faker::Lorem.sentence, run_time: Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%lh%Mm"), cost: Faker::Number.decimal(2)) }
puts "Movies successfully seeded!"

3.times { Auditorium.create!(name: Faker::Lorem.word.upcase, capacity: rand(100..300))}
puts "Auditoria successfully seeded!"


email_address = Faker::Internet.email
20.times { Customer.create!(name: Faker::Name.name, email: email_address, email_confirmation: email_address, cc_number: Faker::Number.number(16), cc_expiration_month: Faker::Number.number(2), cc_expiration_year: Faker::Number.number(4))}
puts "Customers successfully seeded!"

25.times do 
	showtime = Showtime.new(date: Faker::Date.forward(7), time: Faker::Time.between(DateTime.now - 1, DateTime.now))
	showtime.movie = Movie.all.sample
	showtime.auditorium = Auditorium.all.sample
	showtime.save!
end
puts "Showtimes successfully seeded!"

60.times do 
	sale = Sale.new(confirmation_no: rand(999999))
	sale.customer = Customer.all.sample
	sale.showtime = Showtime.all.sample
	sale.save!
end
puts "Sales successfully seeded!"