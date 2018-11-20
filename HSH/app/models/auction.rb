class Auction < ApplicationRecord
  belongs_to :residence, required: false
  has_many :pujas,dependent: :destroy

  validates :residence_id, uniqueness: true
  validates :precioBase, presence: true
end
