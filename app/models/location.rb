class Location
  attr_accessor :latitude, :longitude

  def initialize(x,y)
    @latitude = x.to_f
    @longitude = y.to_f
  end

  #method to calculate ditance between two geocordinates result in km
  def distance(x,y)
    d2r = Math::PI / 180
    r = 637 # Earth Radius in km
    latp1 = self.latitude * d2r
    lngp1 = self.longitude * d2r
    latp2 = x *= d2r
    lngp2 = y *= d2r
    d_latitude = latp2 - latp1
    d_longitude = (lngp2 - lngp1) * Math.cos(latp1)
    distance = r * Math.sqrt( d_latitude * d_latitude + d_longitude * d_longitude )
    distance.round(2)
  end
end