class RatingsController < ApplicationController

  def highestRated
    respond_to do |format|
      format.json { render json: Rating.highest}
    end
  end

end
