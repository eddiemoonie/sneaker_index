class RemoveOrderIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :order_id, :integer
  end
end
