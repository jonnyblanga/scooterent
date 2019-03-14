class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations, dependent: :destroy
  has_many :scooters, through: :reservations

  validates :email, uniqueness: true
  validates :birthday, :presence => true
  mount_uploader :profile_pic, PhotoUploader
  mount_uploader :license_photo, PhotoUploader
end
