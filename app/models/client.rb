class Client < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders # This is a join table
  has_one_attached :photo
  has_many_attached :pictures
  has_many :item_measurements


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
