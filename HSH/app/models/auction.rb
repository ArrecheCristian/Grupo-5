class Auction < ApplicationRecord
  
  validates :residencia_id, uniqueness: true
  validates :precioBase, presence: true
end
