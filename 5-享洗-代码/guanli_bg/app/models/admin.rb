class Admin < ApplicationRecord
  has_secure_password
  belongs_to :role
  belongs_to :region
end
