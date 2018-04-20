class Api::V1::CabsController < ApplicationController
  def index
    render json: {
        error: "hi hello",
        status: 400
    }, status: 400
  end
end
