class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    set_user_data
    flash[:success] = 'You have been logged in successfully!'
    redirect_to root_path
  end

  def destroy
    destroy_user_data
    flash[:success] = 'You have been logged out successfully!'
    redirect_to root_path
  end

  private

  def set_user_data
    session[:user_token] = request.env['omniauth.auth'][:credentials][:token]
    session[:email] = request.env['omniauth.auth'][:info][:email]
    session[:name] = request.env['omniauth.auth'][:info][:name]
    session[:avatar_url] = request.env['omniauth.auth'][:info][:avatar_url]
  end

  def destroy_user_data
    session.delete(:user_token)
    session.delete(:email)
    session.delete(:name)
    session.delete(:avatar_url)
  end
end