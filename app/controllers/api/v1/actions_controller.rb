class API::V1::ActionsController < ApplicationController
  # before_action :redirect_if_not_logged_in

  def index
    if params[:id]
      actions = Action.where(user_id: params[:id])
      render json: actions
    else
      render json: {server_message: 'Could not get actions for user!'}
    end

  end

  def create
    action = Action.new(action_params)
    counter = Counter.find_by(id: params[:counter_id])
    if counter
        action.counter_id = counter.id
        action.name = counter.name
    end
    if action.save
      render json: action
    else
      render json: {server_message: 'Unable to create Action!'}
    end

  end

  def leaders
    render json: User.top_all_time
  end

  private

  def action_params
    params.permit(:reps, :user_id, :name, :counter_id, :weight, :weight_unit, :time_unit)
  end

end
