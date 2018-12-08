class Residence < ApplicationRecord
	has_one :auction, dependent: :destroy
	has_many :weeks, dependent: :destroy
	has_many :hotsales, dependent: :destroy
	has_many :lists, dependent: :destroy

	validates :complejo, presence: true , uniqueness: true
	validates :ubicacion, presence: true
	validates :capacidad, presence: true
	validates :descripcion, presence: true
	validates :estrellas, presence: true


	 scope:ordenFecha,->{order("created_at desc")}
end
