class Reservation < ApplicationRecord
  belongs_to :scooter
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :user, if: :not_owner?

  # def not_owner?
  #   :scooter.user != :user
  # end
end
