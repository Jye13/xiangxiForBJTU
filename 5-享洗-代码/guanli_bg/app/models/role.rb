class Role < ApplicationRecord
  has_many :admins
  has_many :role_authorityships
  has_many :authorities, :through => :role_authorityships

  has_many :role_serviceships
  has_many :services, :through => :role_serviceships
end
