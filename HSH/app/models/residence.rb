class Residence < ApplicationRecord
	has_one :auction, dependent: :destroy
	has_many :weeks, dependent: :destroy

	validates :complejo, presence: true , uniqueness: true
	validates :ubicacion, presence: true
#	validates :semana, presence: true
#	validates :temporada, presence: true
	validates :capacidad, presence: true
	validates :descripcion, presence: true
	validates :estrellas, presence: true
	validates :imagen, presence: true

	 scope:ordenFecha,->{order("created_at desc")}
end
