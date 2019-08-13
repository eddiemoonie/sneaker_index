class PaymentInformation < ApplicationRecord
  belongs_to :order, :optional => true

  def last_four
    last_four = self.card_number.to_s
    last_four = last_four[-4..-1]
    last_four = last_four.to_i
    last_four
  end
end
