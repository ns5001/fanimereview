class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :last_name, :profile_pic, :username)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :last_name, :username)
  end
  
end
