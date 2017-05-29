class UserCard < ApplicationRecord
  belongs_to :user

  has_one :log
end
