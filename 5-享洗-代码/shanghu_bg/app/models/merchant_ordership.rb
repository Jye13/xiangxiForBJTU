class MerchantOrdership < ApplicationRecord
  belongs_to :merchant
  belongs_to :order
end
