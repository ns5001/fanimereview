class AnimeReccomendationsController < ApplicationController
  def getReccomended
    if current_user
      respond_to do |format|
        format.json { render json: current_user.reccomendedAnime}
      end
    end
  end
end
