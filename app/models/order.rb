class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :item_carts # This is a join table
  has_many :items, through: :item_carts # This is a join table

  validates :status, presence: true

end
