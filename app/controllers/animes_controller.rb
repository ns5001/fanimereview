class AnimesController < ApplicationController

  def index
    respond_to do |format|
      format.json { render json: Anime.all}
    end
  end

  def reccomended
    respond_to do |format|
      format.json { render json: Anime.reccomended}
    end
  end

  def show
    respond_to do |format|
      format.json { render json: Anime.find_by(id: params[:id])}
    end
  end

  def searchAnime
    respond_to do |format|
      format.json { render json: Anime.searchFor(params["user_search"])}
    end
  end

  def topThree
    if params[:id]
      respond_to do |format|
        format.json { render json: Anime.find_by(id: params[:id]).topThree }
      end
    end
  end

end
