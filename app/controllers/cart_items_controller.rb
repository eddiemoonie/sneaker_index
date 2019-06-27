class CartItemsController < ApplicationController
  def create
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart

    if current_cart.products.include?(chosen_product)
      @cart_item = current_cart.cart_items.find_by(:product_id => chosen_product)
    else
      @cart_item = CartItem.new
      @cart_item.cart = current_cart
      @cart_item.product = chosen_product
    end

    @cart_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(
      :product_id,
      :cart_id
    )
  end
end
