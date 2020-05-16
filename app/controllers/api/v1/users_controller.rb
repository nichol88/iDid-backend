class API::V1::UsersController < ApplicationController

  def index
    byebug
  end

  def show
    user = User.find_by(id: params[:id])
    if logged_in? && user && user.id === current_user.id
      render json: user, except: :password_digest
    else
      render json: {error: 'Not logged in'}
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
