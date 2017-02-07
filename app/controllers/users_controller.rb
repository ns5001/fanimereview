class UsersController < ApplicationController

  def new
  end

  def inbox
  end

  def show
    @user = current_user
  end

  def index
   if params[:inserted_name]
     @users = User.where(username: params[:inserted_name])
     if @users[0] == current_user
       @users = ["adding themself"]
     end
   else
     @users = User.all
   end
   respond_to do |format|
     format.html { render :show }
     format.json { render :json => @users }
   end
 end
end
