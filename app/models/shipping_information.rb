class ShippingInformation < ApplicationRecord
  belongs_to :order, :optional => true
end
