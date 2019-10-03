class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def login
    password = SecureRandom.hex

    @user = User.find_or_create_by(:uid => auth['uid']) do |u|
      u.username = auth['info']['name']
      u.first_name = auth['info']['name'].split.first
      u.last_name = auth['info']['name'].split.last
      u.email = auth['info']['email']
      u.password = password
    end

    @favorites_list = FavoritesList.new
    @favorites_list.user_id = @user.id
    @favorites_list.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def create
    @user = User.find_by(:username => params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
