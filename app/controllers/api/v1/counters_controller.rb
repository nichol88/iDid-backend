class API::V1::CountersController < ApplicationController

  def index
    render json: Counter.all
  end

  def create
    counter = Counter.create(counter_params)
    if counter.persisted?
      render json: Counter.all
    else
      # alert('Counter could not be saved. Perhaps it already exists?')
      render json: Counter.all
    end
  end

  private

  def counter_params
    params.require(:counter).permit(:name, :kind, :measurement_unit)
  end

end
