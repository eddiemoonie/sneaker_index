class FavoritesListsController < ApplicationController
  before_action :set_favorites_list

  def show
  end

  private

  def set_favorites_list
    @favorites_list ||= FavoritesList.find(session[:user_id]) if session[:user_id]
  end

end
