class API::V1::SessionsController < ApplicationController

  # log in
  def new
    render json: {hi: 'yes'}
  end

  def get_current_user
    if logged_in?
      render json: current_user
    else
      render json: {error: 'Not logged in!'}
    end
  end

  def login
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #byebug
      session[:user_id] = user.id
      # redirect_to user_path(user)
      render json: user
    else
      render json: {error: 'Incorrect email/password combination!'}
    end
  end

end
