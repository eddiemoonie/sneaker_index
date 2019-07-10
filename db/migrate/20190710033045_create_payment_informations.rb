class CreatePaymentInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_informations do |t|
      t.integer :card_number
      t.integer :exp_month
      t.integer :exp_year
      t.integer :ccv
      t.string :full_name
      t.string :street_address
      t.string :city
      t.integer :zip_code
      t.string :state
      t.integer :order_id
      t.timestamps
    end
  end
end
