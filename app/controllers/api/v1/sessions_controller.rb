class API::V1::SessionsController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:get_current_user, :get_state, :set_state]
  # log in
  def new
    render json: {hi: 'yes'}
  end

  def get_current_user
    if logged_in?
      render json: current_user, except: :password_digest
    end
  end

  def get_state
    if logged_in?
      render json: session[:state]
    end
  end

  def set_state
    if logged_in?
      session[:state] = params[:session][:_json]
      render json: session[:state]
    end
  end

  def login
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      render json: user, except: :password_digest
    else
      render json: {server_message: 'Incorrect email/password combination!'}
    end
  end

  def destroy
    # cookies.clear
    session.clear
    render json: {server_message: 'You Logged Out!'}
  end

end
