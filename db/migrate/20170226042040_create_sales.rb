class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
    	t.string :confirmation_no
    	t.integer :customer_id
    	t.integer :showtime_id
      t.timestamps
    end
  end
end
