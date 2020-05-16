class API::V1::ActionsController < ApplicationController

  def index
    if params[:id]
      actions = Action.where(user_id: params[:id])
      render json: actions
    else
      render json: {server_message: 'Could not get actions for user!'}
    end

  end

end
