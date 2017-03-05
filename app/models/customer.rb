class Customer < ApplicationRecord
	# t.string :name
	# t.string :email
	# t.string :cc_number
	# t.string :cc_expiration_month
	# t.string :cc_expiration_year

	has_many :sales
	has_many :showtimes, through: :sales

	validates :name, presence: true, length: { minimum: 2 }
	validates :email, presence: true, length: { minimum: 4 }, confirmation: true
	validates :email_confirmation, presence: true
	validates :cc_number, presence: true, numericality: { only_integer: true }, length: { is: 16 }
	validates :cc_expiration_month, presence: true, numericality: { only_integer: true }, length: { minimum: 1, maximum: 2 }
	validates :cc_expiration_year, presence: true, numericality: { only_integer: true }, length: { is: 4 }

	validates_format_of :email, 
											with: /\A(([^<>()\[\]\\.,;:\s@\"]+(\.[^<>()\[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\z/,
											message: "email format invalid"
end
