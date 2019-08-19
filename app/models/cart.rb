class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, :through => :cart_items

  def subtotal
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.product.price
    end
    return sum
  end

  def total
    self.subtotal + 7.95
  end
end
