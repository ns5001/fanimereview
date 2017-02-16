class AnimeReccomendationsController < ApplicationController
  def getReccomended
    if current_user
      respond_to do |format|
        format.json { render json: current_user.reccomendedAnime}
      end
    end
  end

  def new
    if current_user.friends.length < 1
      flash[:message] = "You current have no freinds to reccomend to"
      redirect_to :back
    end
  end
end
