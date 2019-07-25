class FavoritedProductsController < ApplicationController
  def new
    @favorited_product = FavoritedProduct.new
  end

  def create
    product = Product.find(params[:product_id])
    favorites_list = FavoritesList.find(params[:favorites_list_id])

    @favorited_product = FavoritedProduct.new
    binding.pry
    @favorited_product.product = product
    @favorited_product.favorites_list = favorites_list
    if @favorited_product.save
      redirect_to "/favorites"
    else
      redirect_to products_path
    end
  end

  private

  def favorited_product_params
    params.require(:favorited_product).permit(
      :product_id,
      :favorites_list_id
    )
  end
end
