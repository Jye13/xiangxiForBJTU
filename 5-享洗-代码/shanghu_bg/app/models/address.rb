class Address < ApplicationRecord
  has_many :stations
  has_many :orders

  has_many :user_addressships
  has_many :users, :through => :user_addressships
end
