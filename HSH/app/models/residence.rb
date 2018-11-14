class Residence < ApplicationRecord

	validates :complejo, presence: true
	validates :ubicacion, presence: true
	validates :semana, presence: true
	validates :temporada, presence: true
	validates :capacidad, presence: true
	validates :descripcion, presence: true
	validates :precio, presence: true
	validates :estrellas, presence: true
	validates :imagen, presence: true

	 scope:ordenFecha,->{order("created_at desc")}
end
