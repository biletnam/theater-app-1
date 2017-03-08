class Showtime < ApplicationRecord
	# t.date :date
	# t.time :time
	# t.integer :movie_id
	# t.integer :auditorium_id
	
	has_many :sales

	belongs_to :movie, dependent: :destroy
	belongs_to :auditorium, dependent: :destroy

	validates :date, presence: :true
	validates :time, presence: :true
	validates :movie_id, presence: :true, numericality: { greater_than: 0, only_integer: true }
	validates :auditorium_id, presence: :true, numericality: { greater_than: 0, only_integer: true }

	validate :recent_history_validator


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

  def recent_history_validator
  	fifteen_years_ago = Date.today - 360 * 15
		if date < fifteen_years_ago
			errors.add(:date, "Date must be from #{fifteen_years_ago} and on.")	
		end
	end

end
