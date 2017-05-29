class Address < ApplicationRecord
  has_one :stations
  has_many :orders

  has_many :user_addressships
  has_many :users, :through => :user_addressships
end
