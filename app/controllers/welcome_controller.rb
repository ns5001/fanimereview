require 'pry'

class WelcomeController < ApplicationController
  def index
    binding.pry
    if current_user
      redirect_to user_path(current_user)
    else
      render :index
    end
  end
end
