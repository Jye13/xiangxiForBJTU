class Authority < ApplicationRecord
  has_many :role_authorityships
  has_many :roles, :through => :role_authorityships
end
