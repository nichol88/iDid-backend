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

  # /controllers/counters_controller.rb

  def leaders
    # if a time range query is provided:
    if params[:q]
      # check which was provided,
      if params[:q] == 'week'
        render json: Counter.all.map{ |counter|
          counter.leader(1.week.ago)
        }
      elsif params[:q] == 'month'
        render json: Counter.all.map{ |counter|
          counter.leader(1.month.ago)
        }
        # or return an error if it's invalid
      else
        render json: {error: "Invalid time range"}
      end
    else
      # if no query was provided, return all-time leaders
      render json: Counter.all.map{ |counter|
        counter.leader
      }
    end
  end

  private

  def counter_params
    params.require(:counter).permit(:name, :kind, :measurement_unit)
  end

end
