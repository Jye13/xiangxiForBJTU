class MerchantStationship < ApplicationRecord
  belongs_to :merchant
  belongs_to :station
end