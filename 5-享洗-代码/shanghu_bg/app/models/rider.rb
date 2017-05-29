class Rider < ApplicationRecord
  has_secure_password
  belongs_to :region

  has_many :rider_stationships
  has_many :stations, :through => :rider_stationships

  has_many :orders
end