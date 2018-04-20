class Api::V1::CabsController < ApplicationController

  # Returns all +Cabs+ availbel to Ride
  #
  #   API: GET /cabs
  #
  # @return [Array] An array of {Cab, Cab}
  def index
    @cabs = Cab.includes(:cab_status).where(cab_statuses: {available: true})
    render json: {
        cabs: @cabs,
        status: 200
    }, status: 200
  end

end
