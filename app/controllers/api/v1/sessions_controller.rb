class API::V1::SessionsController < ApplicationController

  # log in
  def new
    render json: {hi: 'yes'}
  end

  def get_current_user
    if logged_in?
      render json: current_user, except: :password_digest
    else
      render json: {server_message: 'Not logged in!'}
    end
  end

  def get_state
    if logged_in?
      render json: session[:state]
    else
      render json: {server_message: 'Not logged in!'}
    end
  end

  def set_state
    if logged_in?
      session[:state] = {value: params[:session][:value]}
    end
  end

  def login
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #byebug
      session[:user_id] = user.id
      # redirect_to user_path(user)
      render json: user, except: :password_digest
    else
      render json: {server_message: 'Incorrect email/password combination!'}
    end
  end

  def destroy
    session.clear
    render json: {server_message: 'You Logged Out!'}
  end

end
