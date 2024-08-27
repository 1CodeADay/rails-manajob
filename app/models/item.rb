class Item < ApplicationRecord
  has_many :item_measurements
  has_many :item_carts # This is a join table
  has_many :orders, through: :item_carts # This is a join table
end
