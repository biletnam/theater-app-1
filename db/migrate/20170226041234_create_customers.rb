class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
    	t.string :name, null: false
    	t.string :email, null: false
    	t.string :cc_number, null: false
    	t.string :cc_expiration_month, null: false
    	t.string :cc_expiration_year, null: false
      t.timestamps
    end
  end
end
