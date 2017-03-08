class Sale < ApplicationRecord
	# t.string :confirmation_no
	# t.integer :customer_id
	# t.integer :showtime_id
    	
	belongs_to :customer
	belongs_to :showtime
	has_one :auditorium, through: :showtime
	has_one :movie, through: :showtime

	validates :confirmation_no, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :customer_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :showtime_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

	validate :available_seats

	private
  def available_seats
		if showtime.sales.count >= auditorium.capacity
			errors.add(:confirmation_no, "cannot be issued.  No seating available for this showtime.")	
		end
	end

end
