class Customer < ApplicationRecord
	has_many :sales
	has_many :showtimes, through: :sales
end
