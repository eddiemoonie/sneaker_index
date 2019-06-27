class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_many :orders
  has_many :shipping_informations, :through => :orders

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, confirmation: { case_sensitive: true }
end
