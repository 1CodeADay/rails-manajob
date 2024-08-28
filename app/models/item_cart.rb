class ItemCart < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_many_attached :photos

  validates :deadline, presence: true
end
