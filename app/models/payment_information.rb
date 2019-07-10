class PaymentInformation < ApplicationRecord
  belongs_to :order, :optional => true
end
