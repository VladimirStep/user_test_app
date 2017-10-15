class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    session[:user_token] = auth_token
    flash[:success] = 'You have been logged in successfully!'
    redirect_to root_path
  end

  def destroy
    session.delete(:user_token)
    flash[:success] = 'You have been logged out successfully!'
    redirect_to root_path
  end

  private

  def auth_token
    request.env['omniauth.auth'][:credentials][:token]
  end
end