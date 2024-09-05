class Item < ApplicationRecord
  has_many :item_carts # This is a join table
  has_many :orders, through: :item_carts # This is a join table
  has_one_attached :photo

  validates :title, :item_type, :specifications, :price, presence: true
end
