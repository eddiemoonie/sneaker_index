class OrdersController < ApplicationController
  before_action :require_logged_in

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    if @order.user != current_user
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
    @order.build_shipping_information
    @order.build_payment_information
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
        ],
        :payment_information_attributes => [
          :card_number,
          :exp_month,
          :exp_year,
          :ccv,
          :full_name,
          :street_address,
          :city,
          :state,
          :zip_code
        ]
      )
    end
end
