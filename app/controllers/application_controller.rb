class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :current_cart
  # before_action :require_logged_in, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  private

    def require_logged_in
      redirect_to signup_path unless logged_in?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end

    helper_method :current_user
    helper_method :current_cart
    helper_method :require_logged_in
end
