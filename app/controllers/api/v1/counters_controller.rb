class API::V1::CountersController < ApplicationController

  def index
    # byebug
    counters = Counter.all
    render json: counters
  end
end
