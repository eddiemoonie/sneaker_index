class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def seller
    self.product.user
  end
end
