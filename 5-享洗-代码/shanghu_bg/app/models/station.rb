class Station < ApplicationRecord
  belongs_to :address
  belongs_to :region
  belongs_to :merchant

  has_many :rider_stationships
  has_many :riders, :through => :rider_stationships

  has_many :merchant_stationships
  has_many :merchants, :through => :merchant_stationships

  has_many :orderstations
  has_many :orders, :through => :orderstations
end
