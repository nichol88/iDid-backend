class API::V1::ActionsController < ApplicationController
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
    end
    if action.save
      render json: action
    else
      render json: {server_message: 'Unable to create Action!'}
    end
  end

  def leaders
    if params[:q]
      if params[:q] == 'month'
        # get leaders from last month
        render json: Counter.all.map {|counter| counter.leader(1.month.ago)}
      elsif params[:q] == 'week'
        render json: Counter.all.map {|counter| counter.leader(1.week.ago)}
      else
        render json: {server_message: 'invalid time range'}
      end
    else
      render json: Counter.all.map {|counter| counter.leader(DateTime.new(2020))}
    end
  end

  private

  def action_params
    params.permit(:reps, :user_id, :counter_id, :weight)
  end

end
