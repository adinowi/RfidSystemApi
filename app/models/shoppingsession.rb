class Shoppingsession < ApplicationRecord
  belongs_to :sensor
  belongs_to :user
end
