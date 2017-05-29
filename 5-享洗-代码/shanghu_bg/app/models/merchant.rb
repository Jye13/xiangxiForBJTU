class Merchant < ApplicationRecord
  has_secure_password
  has_many :merchant_categoryships
  has_many :categories, :through => :merchant_categoryships

  has_many :merchant_productships
  has_many :products, :through => :merchant_productships

  has_many :merchant_stationships
  has_many :stations, :through => :merchant_stationships

  has_many :merchant_orderships
  has_many :orders, :through => :merchant_orderships

  has_many :merchant_incomes
  has_many :merchant_logs
end
