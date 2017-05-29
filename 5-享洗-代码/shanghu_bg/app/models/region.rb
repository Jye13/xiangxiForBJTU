class Region < ApplicationRecord
  has_many :admins
  has_many :stations
  has_many :riders
end
