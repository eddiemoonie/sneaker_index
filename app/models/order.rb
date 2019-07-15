class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  has_one :shipping_information, :inverse_of => :order, :autosave => true
  has_one :payment_information, :inverse_of => :order, :autosave => true

  accepts_nested_attributes_for :shipping_information
  accepts_nested_attributes_for :payment_information
end
