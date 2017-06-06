require 'httparty'
require 'json'

class MainController < ApplicationController
    include HTTParty, MainHelper

  def index
    flash.now[:info] = 'Welcome!'
  end

  def search
    @res = HTTParty.get('https://itunes.apple.com/search?term=' + verify_input(params[:artist]))
    @results = JSON.parse(@res.body)['results']

    if @results.length <= 0
      flash.now[:warning] = "I'm sorry, this band is not yet cool."
    end
  end

  def show
    @fave = Favorite.new
    @res = HTTParty.get('https://itunes.apple.com/lookup?entity=song&id=' + params[:id])
    @single_track = JSON.parse(@res.body)['results']
  end
end
