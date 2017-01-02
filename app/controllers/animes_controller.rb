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
    binding.pry

  end
end
