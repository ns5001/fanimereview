class RatingReccomendationsController < ApplicationController
  def getReccomended
    if current_user
      respond_to do |format|
        format.json { render json: current_user.reccomendedRating}
      end
    end
  end

  def new
    if current_user.friends.length < 1
      flash[:message] = "You currently have no freinds to reccomend to"
      redirect_to :back
    end
    @user = current_user.id
  end

  def create
    # binding.pry
    @rating_reccomendation = RatingReccomendation.create(rating_reccomendations_params)
    redirect_to user_session_path
  end

  private

  def rating_reccomendations_params
    params.require(:rating_reccomendation).permit(:rating_id, :receiver_id, :user_id)
  end

end
