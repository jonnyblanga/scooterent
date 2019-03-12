class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_many :reviews, through: :reservations

  def owner
    self.user
  end

  validates :license_plate, presence: true, uniqueness: true
  validates :model, presence: true
  validates :make, presence: true
  validates :year, presence: true
  validates :price, presence: true
  validates :engine, inclusion: { in: %w(Disel Gasoline Eletrical gpl hybrid) }

  # mount_uploader :photo, PhotoUploader

end
