class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user

  private

  def authenticate_user
    unless session[:user_token]
      flash[:warning] = 'You have to login before proceed!'
      redirect_to login_path
    end
    set_user
  end

  def set_user
    @user = {
      name: session[:name],
      avatar_url: session[:avatar_url]
    }
  end
end
