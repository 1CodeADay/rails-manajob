class ItemMeasurement < ApplicationRecord
  belongs_to :client

  validates :title, :dimensions, presence: true
end
