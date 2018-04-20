class Ride < ApplicationRecord
  belongs_to :cab

  attr_accessor :pink

  PER_KM = 2
  PINK_CHARGE = 5

  #validations

  validates :source_latitude, :source_longitude, presence: true
  validates :cab, presence: true
  validates :destination_latitude, presence: true
  validates :destination_longitude, presence: true

  after_create :change_availability

  def change_availability
    cab_status = self.cab.cab_status
    cab_status.update_status
  end

  def calculate_rent
    location = Location.new(self.source_latitude, self.source_longitude)
    distance = location.distance(self.destination_latitude, self.destination_latitude)
    rent = distance * PER_KM
    rent = rent + PINK_CHARGE if self.cab.pink
  end

end