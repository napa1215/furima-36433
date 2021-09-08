class Order < ApplicationRecord
  has_many :item
  has_many :user
  has_one :address
end
