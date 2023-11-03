class Client < ApplicationRecord
  has_many :bookings, dependent: :destroy

  validates :name, :email, :password, presence: true
end
