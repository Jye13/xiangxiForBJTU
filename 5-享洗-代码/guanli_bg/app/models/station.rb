class Station < ApplicationRecord
  belongs_to :address
  belongs_to :region

  has_many :merchant_stationships
  has_many :merchants, :through => :merchant_stationships

  has_many :rider_stationships
  has_many :riders, :through => :rider_stationships
end
