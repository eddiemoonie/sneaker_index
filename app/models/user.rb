class User < ApplicationRecord
  has_secure_password

  has_one :favorites_list
  has_many :favorited_products, :through => :favorites_list
  has_many :products
  has_many :orders
  has_many :reviews
  has_many :shipping_informations, :through => :orders
  has_many :payment_informations, :through => :orders

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: { case_sensitive: true }

  def average_rating
    sum = 0
    count = 0
    self.products.each do |product|
      if product.review
        sum += product.rating
        count += 1
      end
    end
    if count = 0
      return ""
    else
      sum/count
    end
  end
end
