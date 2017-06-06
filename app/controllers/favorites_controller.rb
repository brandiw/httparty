class FavoritesController < ApplicationController
  def index
    @faves = Favorite.all
  end

  def create
    f = Favorite.create(fave_params)

    f.errors.messages.each do |attr, msg|
      flash[:danger] = msg[0]
    end

    redirect_to favorites_path
  end

  def destroy
    Favorite.find(params[:id]).delete
    flash[:info] = 'Successfully unfavorited'
    redirect_to favorites_path
  end

  private

  def fave_params
    params.require(:favorite).permit(:title, :artist, :preview_url, :artwork_url, :track_length)
  end
end
