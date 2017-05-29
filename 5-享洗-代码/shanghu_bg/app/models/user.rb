class User < ApplicationRecord
  has_secure_password
  has_many :orders

  has_many :user_addressship
  has_many :addresses, :through => :user_addressship

  has_one :user_card
end