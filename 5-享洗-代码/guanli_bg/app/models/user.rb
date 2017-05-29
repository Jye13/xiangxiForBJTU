class User < ApplicationRecord
  has_secure_password
  has_many :orders

  has_many :user_addressships
  has_many :addresses, :through => :user_addressships

  has_one :user_card

  has_many :user_couponships
  has_many :coupons, :through => :user_couponships
end