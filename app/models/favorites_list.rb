class FavoritesList < ApplicationRecord
  belongs_to :user
  has_many :favorited_products
  has_many :products, :through => :favorited_products
end
