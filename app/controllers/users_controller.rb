class UsersController < ApplicationController

   def custom_sign_out
     sign_out current_user
     redirect_to root_path
   end

  def show

  end

  def index

  end

end
