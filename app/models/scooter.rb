class Scooter < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_many :reviews, through: :reservations

  def owner
    self.user
  end
end
