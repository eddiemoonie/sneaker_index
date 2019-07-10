class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  has_one :shipping_information, :inverse_of => :order, autosave: true
  # has_one :payment_information
  # has_one :billing_information

  accepts_nested_attributes_for :shipping_information
end
