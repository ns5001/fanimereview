class RatingsController < ApplicationController

  def highestRated
    respond_to do |format|
      format.json { render json: Rating.highest}
    end
  end

  def top_three
    respond_to do |format|
      format.json {render json: Rating.top_three(params[:id])}
    end
  end

  def userReviews
    if current_user
      respond_to do |format|
        format.json {render json: current_user.reviews}
      end
    end
  end

  def new
  end

  def index
  end

  def create
    @rating = Rating.create(rating_params)
    if current_user
      @rating.user_id = current_user.id
      @rating.save
    end
    redirect_to '/'
  end

  private

  def rating_params
    params.require(:rating).permit(:role, :art, :character, :anime_id, :overall, :rating, :user_id, :plot, :review)
  end

end
