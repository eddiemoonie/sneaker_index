class CreateShippingInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.integer :zip_code
      t.string :state
      t.integer :order_id

      t.timestamps
    end
  end
end
