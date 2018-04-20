class Location
  attr_accessor :latitude, :longitude

  def initialize(x,y)
    @latitude = x.to_f
    @longitude = y.to_f
  end

  #find the square of distance
  #sqrt is weight opertion squre is enough

  def distance_square(x,y)
    dlatitude = x - self.latitude;
    dlongitude = y - self.longitude;
    p "before ret"
    return dlatitude * dlatitude + dlongitude * dlongitude;
  end
end