class UserAdddressship < ApplicationRecord
  belongs_to :users
  belongs_to :addresses
end
