class Auction < ApplicationRecord
  validates :residencia_id, uniqueness: true
end
