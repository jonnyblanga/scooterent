class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :scooters
  has_many :reservations

  def major_age?
    (DateTime.now - :birthday).to_i >= 18
  end

  validates :email, uniqueness: true
  validates :birthday, :presence => true


end
