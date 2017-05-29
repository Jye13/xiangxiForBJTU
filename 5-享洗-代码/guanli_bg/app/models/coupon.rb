class Coupon < ApplicationRecord
  has_many :user_couponships
  has_many :users, :through => :user_couponships
end
