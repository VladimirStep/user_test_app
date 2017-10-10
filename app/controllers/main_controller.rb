class MainController < ApplicationController
  def index

  end

  def auth_fail
    flash[:danger] = 'Authentification failed'
    redirect_to root_path
  end
end