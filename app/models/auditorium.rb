class Auditorium < ApplicationRecord
	# t.string :name
	# t.integer :capacity

	has_many :showtimes
	has_many :movies, through: :showtimes

	validates :name, presence: :true
	validates :capacity, presence: :true, numericality: { greater_than: 0, only_integer: true }

end
