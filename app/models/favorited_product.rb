class FavoritedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :favorites_list
end
