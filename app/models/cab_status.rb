class CabStatus < ApplicationRecord
  belongs_to :cab


  def update_status
    self.update_column( :available,  !self.available)
  end

  #Update cab availabe loacton after ride
  def update_location(latitude, longitude)
    self.update_columns(latitude: latitude, longitude: longitude)
  end
end
