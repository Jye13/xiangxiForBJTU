class Service < ApplicationRecord
  has_many :role_serviceships
  has_many :roles, :through => :role_serviceships
end
