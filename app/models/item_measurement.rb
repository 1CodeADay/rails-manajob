class ItemMeasurement < ApplicationRecord
  belongs_to :item

  validates :title, :dimensions, presence: true
end
