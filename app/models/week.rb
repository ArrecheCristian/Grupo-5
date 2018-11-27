class Week < ApplicationRecord
	belongs_to :residence, required: false

 	validates :residence_id, presence: true
  	validates :fecha, presence: true
  	validates :estado, presence: true
end
