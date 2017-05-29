class Order < ApplicationRecord
  has_many :orderstations
  has_many :stations, :through => :orderstations

  has_many :merchant_orderships
  has_many :merchants, :through => :merchant_orderships
end