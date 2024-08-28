class Client < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders # This is a join table
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
end
