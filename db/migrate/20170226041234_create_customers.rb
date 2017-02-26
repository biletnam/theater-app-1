class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
    	t.string :name
    	t.string :email
    	t.string :cc_number
    	t.string :cc_expiration_date
      t.timestamps
    end
  end
end
