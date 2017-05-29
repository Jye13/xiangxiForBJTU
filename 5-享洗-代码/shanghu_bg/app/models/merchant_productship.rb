class MerchantProductship < ApplicationRecord
  belongs_to :merchant
  belongs_to :product
end
