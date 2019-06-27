class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  has_one :shipping_information
end
