class Showtime < ApplicationRecord
	# t.date :date
	# t.time :time
	# t.integer :movie_id
	# t.integer :auditorium_id
	
	has_many :sales

	belongs_to :movie, dependent: :destroy
	belongs_to :auditorium, dependent: :destroy

	def is_available?
		sales.count < auditorium.capacity
	end

	def revenue_to_date
		sales.count * movie.cost
	end

	private

	def compose_date()
		Date
	end

	def is_valid_date?
    errors.add(:happened_at, 'must be a valid datetime') 
  end

end
