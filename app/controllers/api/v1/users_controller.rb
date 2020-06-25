class API::V1::UsersController < ApplicationController

  before_action :redirect_if_not_logged_in, except: :create

  def show
    user = User.find_by(id: params[:id])
    if user && user.id === current_user.id
      render json: user, except: :password_digest
    else
      render json: {server_message: 'Not logged in! (users#show)'}
    end
  end

  def create
    user_params[:email] = user_params[:email].downcase
    user = User.create(user_params)
    if user.persisted?
      render json: user, except: :password_digest
    else
      render json: {server_message: 'User creation failed!'}
    end
  end

  def leaders(start_time = nil)

    if start_time
      # get all time leaders
    else
      # start at start_time
    end

  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end
end
