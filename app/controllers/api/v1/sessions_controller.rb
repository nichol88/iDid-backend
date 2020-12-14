class API::V1::SessionsController < ApplicationController
  before_action :set_user, only: :login

  def login
    # binding.pry
    if @user.valid_password?( session_params[:password] )
      # session[:user_id] = @user.id
      render json: @user, status: 200
    else
      # render json: {errors: [message: e.message]}, status: 401
      render json: {errors: [message: 'Invalid password.']}, status: 401
    end
  end

  def destroy
    session.clear
    render json: {server_message: 'You Logged Out!'}, status: 200
  end

  def error_handler(e)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def set_user
    # binding.pry
    begin
      @user = User.find_by! email: params[:email]
    rescue ActiveRecord::RecordNotFound => e
      # binding.pry
      render json: {errors: [message: e.message]}, status: 404
    end
  end

end
