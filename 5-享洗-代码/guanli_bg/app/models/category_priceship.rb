class CategoryPriceship < ApplicationRecord
  belongs_to :category
  belongs_to :price
end
