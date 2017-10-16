class MainController < ApplicationController
  def index
    @profile = User.profile(session[:user_token])
  end

  def auth_fail
    flash[:danger] = 'Authentification failed'
    redirect_to root_path
  end
end