class Api::V1::RidesController < ApplicationController


  # Creates a new +Ride+ object, and update status of  +CabStatus+.
  # Assign nearest cab  to +Ride+.
  #
  #   API: POST /rides/{pink, source_latitude, source_longitude, dest_latitude, _dest_longitude}
  #
  # @return [cab_number] The created +Ride+

  def create
    cab = Cab.assign_nearest_cab(ride_params[:source_latitude], ride_params[:source_longitude],ride_params[:pink])
    if cab
      @ride = Ride.new(ride_params.merge(cab_id: cab.id))
      if @ride.save
       render json: {message: 'successfully created', cab_number: cab.vehicle_no}, status: :created
      end
    else
      render json: {message: 'cab not available'}, status: :failed
    end
  end

  # Update a new +Ride+ object, and update status of  +CabStatus+.
  # Change Availabilty of cab +CabStatus+.
  #
  #   API: PUT /rides/:id  { dest_latitude, _dest_longitude, cab_id}
  #
  # @return [ride_cost] updated +Ride+

  def update
    @ride = Ride.find(params[:id])
      if @ride.update_attributes(complete_params.merge(end_at: Time.now))
        @ride.change_availability
        @rent = @ride.calculate_rent
        render json: {message: 'successfully reached', ride_cost: @rent }, status: :completed
      end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def ride_params
    params.require(:ride).permit(:pink, :source_latitude, :source_longitude, :destination_latitude, :destination_longitude)
  end

  def complete_params
    params.require(:ride).permit(:id, :destination_latitude, :destination_longitude, :cab_id)
  end

end
