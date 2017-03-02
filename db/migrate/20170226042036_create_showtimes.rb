class CreateShowtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :showtimes do |t|
    	t.date :date
    	t.time :time
    	t.integer :movie_id
    	t.integer :auditorium_id
      t.timestamps
    end
  end
end
