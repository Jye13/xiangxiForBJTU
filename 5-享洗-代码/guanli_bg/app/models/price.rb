class Price < ApplicationRecord
  has_many :category_priceships
  has_many :categories, :through => :category_priceships
end
