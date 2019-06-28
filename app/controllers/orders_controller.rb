class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @current_cart.cart_items.each do |item|
      @order.cart_items << item
      item.cart_id = nil
    end
    binding.pry
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    # redirect_to root_path
    redirect_to order_path(@order)
  end

  private
    def order_params
      binding.pry
      params.require(:order).permit(
        :user_id,
        :shipping_information => [
          :first_name,
          :last_name,
          :street_address,
          :city,
          :state,
          :zip_code
        ]
      )
    end

end
