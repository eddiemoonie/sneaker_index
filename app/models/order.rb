class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, :through => :cart_items
  belongs_to :user
  has_one :shipping_information, :inverse_of => :order, :autosave => true
  has_one :payment_information, :inverse_of => :order, :autosave => true

  accepts_nested_attributes_for :shipping_information
  accepts_nested_attributes_for :payment_information

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
