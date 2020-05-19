class API::V1::UsersController < ApplicationController

  before_action :redirect_if_not_logged_in, except: :create

  def index
    # byebug
  end

  def show
    user = User.find_by(id: params[:id])
    if user && user.id === current_user.id
      render json: user, except: :password_digest
    else
      render json: {server_message: 'Not logged in! (users#show)'}
    end
  end

  def create
    user = User.create(user_params)
    if user.persisted?
      render json: user, except: :password_digest
    else
      render json: {server_message: 'User creation failed!'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end
end
