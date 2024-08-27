class Client < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders # This is a join table
end
