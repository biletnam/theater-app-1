class Customer < ApplicationRecord
	# t.string :name
	# t.string :email
	# t.string :cc_number
	# t.string :cc_expiration_date

	has_many :sales
	has_many :showtimes, through: :sales
end
