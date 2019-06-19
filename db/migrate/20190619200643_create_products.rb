class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.attachment :image
      t.text :description
      t.float :price
      t.string :condition
      t.float :size
      t.integer :user_id
      t.timestamps
    end
  end
end
