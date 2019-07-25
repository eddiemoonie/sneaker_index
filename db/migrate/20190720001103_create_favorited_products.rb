class CreateFavoritedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_products do |t|
      t.integer :product_id
      t.integer :favorites_list_id
      t.timestamps
    end
  end
end
