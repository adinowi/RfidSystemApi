class Shoppinglist < ApplicationRecord
  belongs_to :shoppingsession
  belongs_to :tag
end
