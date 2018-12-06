class Cancellation < ApplicationRecord

	validates :complejo, presence: true
	validates :descripcion, presence: true
	validates :fecha, uniqueness: { scope: :complejo}
	validates :usuario, presence: true
	validates :motivo, presence: true

end
