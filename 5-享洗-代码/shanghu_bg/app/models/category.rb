class Category < ApplicationRecord
  has_many :products, :dependent => :destroy
  has_many :merchant_categoryships
  has_many :merchants, :through => :merchant_categoryships
end
