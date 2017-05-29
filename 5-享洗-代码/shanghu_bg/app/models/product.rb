class Product < ApplicationRecord
  belongs_to :category
  has_many :merchant_productships
  has_many :merchants, :through => :merchant_productships

  has_many :prices
  has_many :items
end
