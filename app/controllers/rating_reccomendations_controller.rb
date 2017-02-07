class RatingReccomendationsController < ApplicationController
  def getReccomended
    if current_user
      respond_to do |format|
        format.json { render json: current_user.reccomendedRating}
      end
    end
  end
end
