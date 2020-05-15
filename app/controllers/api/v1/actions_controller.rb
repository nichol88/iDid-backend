class API::V1::ActionsController < ApplicationController

  def index
    if params[:user_id]
      actions = Action.where(user_id: params[:user_id])
      render json: actions
    else
      redirect_to login_path
    end

  end

end
