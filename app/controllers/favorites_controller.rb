class FavoritesController < ApplicationController
  def create 
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの写真をおきに入り登録ました!"
  end 

  def destroy 
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんの写真をお気に入る解除しました!"
  end

  def index
    @favorites = current_user.favorite_pictures
  end
end