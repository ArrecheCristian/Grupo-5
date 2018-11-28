class Week < ApplicationRecord
	belongs_to :residence, required: false

 	validates :residence_id, presence: true
  	validates :fecha, uniqueness: {scope: :residence_id}
  	validates :estado, presence: true
end
