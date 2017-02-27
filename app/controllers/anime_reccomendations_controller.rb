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
    @user = current_user.id
  end

  def create
    # binding.pry
    @anime_reccomendation = AnimeReccomendation.create(anime_reccomendations_params)
    redirect_to user_session_path
  end

  private

  def anime_reccomendations_params
    params.require(:anime_reccomendation).permit(:anime_id, :receiver_id, :user_id)
  end

end
