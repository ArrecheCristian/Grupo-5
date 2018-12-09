class List < ApplicationRecord
	 belongs_to :residence, required: false

	 validates :fecha, presence: true
end
