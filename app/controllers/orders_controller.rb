class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.build_shipping_information
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    @order.cart_items.each do |cart_item|
      cart_item.product.sold = true
      cart_item.product.save
    end
    redirect_to order_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(
        :shipping_information_attributes => [
          :first_name,
          :last_name,
          :email,
          :street_address,
          :city,
          :state,
          :zip_code
        ]
      )
    end
end
