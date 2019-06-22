class Shoppingsession < ApplicationRecord
  belongs_to :sensor
  belongs_to :user
  has_many :shoppinglists
end
