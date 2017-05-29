class Orderstation < ApplicationRecord
  belongs_to :orders
  belongs_to :stations
end