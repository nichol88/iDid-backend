class API::V1::CountersController < ApplicationController

  def index
    render json: Counter.all
  end

  def create
    counter = Counter.create(name: params[:counterFormData][:name], kind: 'default')

    counter[:kind] = 'weighted' if params[:counterFormData][:weighted]
    counter[:kind] = 'timed' if params[:counterFormData][:timed]

    if counter.save
      render json: Counter.all
    else
      render json: {server_message: "Could not create counter! #{counter.errors.full_messages.to_sentence}"}
    end
  end

  private

  def counter_params
    params.require(:counterFormData).permit(:name, :weighted, :timed, :kind)
  end

end
