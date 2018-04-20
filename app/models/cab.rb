class Cab < ApplicationRecord
  has_one :cab_status

  def self.assign_nearest_cab(latitude, longitude, pink)
    cabs = self.get_available_cab(pink)
    nearest_cab = nil #if fount nearest cab hold it id
    nearest_distance = 0.0
    cabs.each do |cab|
      location = Location.new(latitude, longitude)
      distance = location.distance(cab.cab_status.latitude, cab.cab_status.longitude)

      if distance.to_i < nearest_distance.to_i
        nearest_distance = distance
        nearest_cab = cab
      end
    end
    nearest_cab
  end

  def self.get_available_cab(pink)
    if pink
      cabs =  Cab.includes(:cab_status).where(cab_statuses: {available: true}, pink: true)
    else
      cabs =  Cab.includes(:cab_status).where(cab_statuses: {available: true})
    end
  end

end
