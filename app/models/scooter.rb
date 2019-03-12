class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_many :reviews, through: :reservations
  mount_uploader :photo, PhotoUploader
end
