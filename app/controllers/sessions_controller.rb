class SessionsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
  def new

  end

  def create
    session[:name] = params[:name]

    if params[:name].blank?
      redirect_to '/login'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.delete(:name)
    redirect_to login_path
  end

  private
  def require_login
    return head(:forbidden) unless session.include?(:name)
  end
end
