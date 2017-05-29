class RiderStationship < ApplicationRecord
  belongs_to :rider
  belongs_to :station
end
