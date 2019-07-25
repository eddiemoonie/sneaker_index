class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @favorites_list = FavoritesList.new
      @favorites_list.user_id = @user.id
      @favorites_list.save
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation
      )
    end

end
